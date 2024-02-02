import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/random_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRepository {
  Future<void> addImagesSet(ImageDetails d) async {
    String folderName = 'uploads/images_${randomName()}';
    List<String> imageUrls = [];
    try {
      for (var image in d.images!) {
        imageUrls.add(await _uploadImage(image, folderName) ?? '');
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

  Future<String?> getImagesUrl() async {
    String imageUrl = '';
    try {
      QuerySnapshot images = await imagesCollection.get();
      for (var image in images.docs) {
        var data = image.data() as Map<String, dynamic>;
        String folderName = data['folderName'];
        final storageRef = storageReference.child(folderName);
        final listResult = await storageRef.listAll();
        await Future.forEach(listResult.items, (Reference ref) async {
          imageUrl = await ref.getDownloadURL();
        });
      }
      return imageUrl;
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
    return null;
  }

  Future<String?> _uploadImage(String path, String folderName) async {
    File image = File(path);
    int dotIndex = path.lastIndexOf('.');
    String fileName = '${randomName()}${path.substring(dotIndex, path.length)}';

    try {
      Reference storageRef = storageReference.child('$folderName/$fileName');
      await storageRef.putFile(image);
      return await storageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    }
    return '';
  }
}
