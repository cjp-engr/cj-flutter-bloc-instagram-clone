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

class ImageRepository {
  Future<void> addImagesSet(ImageDetails d) async {
    String folderName = 'uploads/images_${randomName()}';
    try {
      for (var image in d.images!) {
        _uploadImage(image, folderName);
      }
      await imagesCollection.add({
        'userId': fbUserId,
        'folderName': folderName,
        'likeCount': 0,
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

  FutureOr<List<ImageDetails>?> getImagesSet() async {
    List<ImageDetails> imageDetails = [];
    List<String> imageUrl = [];
    String? userId;
    int? likeCount;
    String? description;
    List<String> comments = [];
    try {
      QuerySnapshot images = await imagesCollection.get();
      for (var image in images.docs) {
        var data = image.data() as Map<String, dynamic>;
        String folderName = data['folderName'];
        userId = data['userId'];
        likeCount = data['likeCount'];
        description = data['description'];
        comments = data['comments'];
        imageUrl = (await _getImageUrls(folderName));
        imageDetails.add(
          ImageDetails(
            userId: userId,
            images: imageUrl,
            likeCount: likeCount,
            description: description,
            comments: comments,
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
}
