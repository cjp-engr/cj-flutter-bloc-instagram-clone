import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/repository/auth/auth_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageRepository {
  Future<void> addImageSet(ImageDetails d) async {
    try {
      await usersCollection.doc(fbUserId).collection('images').add({
        '${d.userId}': fbUserId,
        '${d.images}': d.images,
        '${d.likeCount}': d.likeCount,
        '${d.description}': d.description,
        '${d.comments}': d.comments,
      });
    } on FirebaseException catch (e) {
      handleException(e);
    } catch (e) {
      handleException(e);
    }
  }

  Future<void> fetchImageSet() async {
    try {
      await usersCollection.doc(fbUserId).collection('images').add({
        'userId': 'test',
        'imageId': 'test',
        'image': 'test',
        'likeCount': 'test',
        'description': 'test',
      });
    } on FirebaseException catch (e) {
      handleException(e);
    } catch (e) {
      handleException(e);
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
      handleException(e);
    } catch (e) {
      handleException(e);
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
      handleException(e);
    } catch (e) {
      handleException(e);
    }
  }
}
