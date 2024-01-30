import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/random_name.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRepository {
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

  Future<void> addImageSet(ImageDetails d) async {
    String folderName = 'uploads/images_${randomName()}';
    try {
      for (var image in d.images!) {
        _uploadImage(image, folderName);
      }

      await usersCollection.doc(fbUserId).collection('images').add({
        'userId': fbUserId,
        'folderName': folderName,
        'likeCount': 0,
        'description': d.description,
        'comments': d.comments,
      });
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }

  Future<void> fetchImageSet() async {
    try {
      // final snapshot =
      //     await storageReference.child('users/$fbUserId').getData();
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }

  Future<void> updateImageSet() async {
    try {
      await usersCollection.doc(fbUserId).collection('images').add(
        {
          'userId': 'test',
        },
      );
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }

  Future<void> deleteImageSet() async {
    try {
      await usersCollection.doc(fbUserId).collection('images').add(
        {
          'userId': 'test',
        },
      );
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }
}
