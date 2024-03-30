import 'dart:async';
import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/random_name.dart';
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
    List<String> imageUrl = [];
    try {
      QuerySnapshot images = await imagesCollection.get();
      for (var image in images.docs) {
        var data = image.data() as Map<String, dynamic>;
        imageUrl = await _getImageUrls(data['folderName']);
        String? userName = await _getUserName(data['userId']);
        imageDetails.add(
          ImageDetails(
            userId: data['userId'],
            // userName: data['userName'],
            userName: userName,
            location: data['location'],
            images: imageUrl,
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

  FutureOr<String?> _getUserName(String id) async {
    try {
      final DocumentSnapshot userDoc = await userCollection.doc(fbUserId).get();
      final data = userDoc.data() as Map<String, dynamic>?;
      if (userDoc.exists) {
        return data!['userName'];
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
}
