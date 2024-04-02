import 'dart:async';
import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/random_name.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fbUserId = fbAuth.currentUser!.uid;
final imagesCollection = FirebaseFirestore.instance.collection('images');
final userCollection = FirebaseFirestore.instance.collection('users');

class ImageRepository {
  //! START - Add operation
  Future<void> addImages(ImageDetails d) async {
    String folderName = 'uploads/images_${randomName()}';
    try {
      for (var image in d.images!) {
        _uploadImage(image, folderName);
      }
      await imagesCollection.add({
        'userId': fbUserId,
        'folderName': folderName,
        'likeCount': 0,
        'userName': d.userName,
        'location': d.location,
        'description': d.description,
        'comments': d.comments,
        'dateCreated': DateTime.now().millisecondsSinceEpoch,
      });
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }

  Future<void> _uploadImage(String path, String folderName) async {
    File image = File(path);
    int dotIndex = path.lastIndexOf('.');
    String fileName = '${randomName()}${path.substring(dotIndex, path.length)}';

    try {
      Reference storageRef = storageReference.child('$folderName/$fileName');
      await storageRef.putFile(image);
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    }
  }

  //! END - Add operation

  //! START - Read operation
  FutureOr<List<ImageDetails>?> getImages() async {
    List<ImageDetails> imageDetails = [];
    List<String> imageUrls = [];
    try {
      QuerySnapshot images = await imagesCollection.get();
      for (var imagesSet in images.docs) {
        var data = imagesSet.data() as Map<String, dynamic>;

        imageUrls = await _getImageUrls(data['folderName']);
        final user = await _getUserDetails(data['userId']);
        imageDetails.add(
          ImageDetails(
            userId: data['userId'],
            userName: user?.userName,
            userImage: user?.imageUrl,
            location: data['location'],
            imagesId: imagesSet.id,
            images: imageUrls,
            likeCount: data['likeCount'],
            description: data['description'],
            comments: _getComments(data['comments']),
          ),
        );
      }
      return imageDetails;
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
    return null;
  }

  FutureOr<UserDetails?> _getUserDetails(String id) async {
    try {
      final DocumentSnapshot userDoc = await userCollection.doc(fbUserId).get();
      final data = userDoc.data() as Map<String, dynamic>?;
      if (userDoc.exists) {
        return UserDetails(
          userName: data!['userName'],
          imageUrl: data['imageUrl'],
        );
      }
      throw 'User not found';
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
    return null;
  }

  List<String> _getComments(Iterable<dynamic> elements) {
    List<String> comments = [];

    for (var comment in List.from(elements)) {
      comments.add(comment);
    }
    return comments;
  }

  FutureOr<List<String>> _getImageUrls(String folderName) async {
    List<String> imageUrl = [];
    try {
      final storageRef = storageReference.child(folderName);
      final listResult = await storageRef.listAll();
      await Future.forEach(listResult.items, (Reference ref) async {
        imageUrl.add(await ref.getDownloadURL());
      });
      return imageUrl;
    } catch (e) {
      firebaseHandleException(e);
    }
    return [IconRes.testOnly];
  }

  //! END - Read operation

  //! START - Delete operation

  Future<void> deleteImages(String id) async {
    await imagesCollection.doc(id).delete();
    try {} on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }

  //! END - Delete operation

  //! START - Update operation

  Future<void> updateImages(List<String> images) async {
    try {
      await Future.forEach(images, (value) async {
        await FirebaseStorage.instance.refFromURL(value).delete();
      });
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }

  //! END - Update operation
}
