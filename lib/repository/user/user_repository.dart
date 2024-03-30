import 'dart:async';
import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/random_name.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fbUserId = fbAuth.currentUser!.uid;
final userCollection = FirebaseFirestore.instance.collection('users');

class UserRepository {
  //! START - Read operation
  FutureOr<UserDetails?> getDetails() async {
    try {
      final DocumentSnapshot userDoc = await userCollection.doc(fbUserId).get();
      final data = userDoc.data() as Map<String, dynamic>?;
      if (userDoc.exists) {
        return UserDetails(
          email: data!['email'],
          fullName: data['fullName'],
          userName: data['userName'],
          description: data['description'],
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

  Future<void> updateDetails(UserDetails details) async {
    try {
      await userCollection.doc(fbUserId).update({
        'email': details.email,
        'fullName': details.fullName,
        'userName': details.userName,
        'description': details.description,
        'imageUrl': details.imageUrl,
      });
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }

  Future<void> updatePhoto(UserDetails details, String path) async {
    String folderName = 'profile_photo';
    File image = File(path);
    int dotIndex = path.lastIndexOf('.');
    String fileName = '${randomName()}${path.substring(dotIndex, path.length)}';

    try {
      Reference storageRef = storageReference.child('$folderName/$fileName');
      await storageRef.putFile(image);
      String url = await storageRef.getDownloadURL();
      await updateDetails(details.copyWith(imageUrl: url));
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    }
  }
}
