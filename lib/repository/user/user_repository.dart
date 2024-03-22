import 'dart:async';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final fbUserId = fbAuth.currentUser!.uid;
final userCollection = FirebaseFirestore.instance.collection('users');

const String email = 'email';
const String fullName = 'fullName';
const String userName = 'userName';
const String description = 'description';

class UserRepository {
  //! START - Read operation
  FutureOr<UserDetails?> getDetails() async {
    try {
      final DocumentSnapshot userDoc = await userCollection.doc(fbUserId).get();
      final userData = userDoc.data() as Map<String, dynamic>?;
      if (userDoc.exists) {
        return UserDetails(
          email: userData![email],
          fullName: userData[fullName],
          userName: userData[userName],
          description: userData[description],
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
        email: details.email,
        fullName: details.fullName,
        userName: details.userName,
        description: details.description,
      });
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
  }
}
