import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

final usersCollection = FirebaseFirestore.instance.collection('users');

class AuthRepository {
  fb_auth.User? get currentUser => fbAuth.currentUser;

  Future<void> signup({
    required UserItem user,
  }) async {
    try {
      final userCredential = await fbAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final signedInUser = userCredential.user!;

      await usersCollection.doc(signedInUser.uid).set({
        'email': user.email,
        'userName': user.details.userName,
        'fullName': user.details.fullName,
        'private': false,
      });
    } catch (e) {
      throw firebaseHandleException(e);
    }
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    try {
      await fbAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw firebaseHandleException(e);
    }
  }

  Future<void> signout() async {
    try {
      await fbAuth.signOut();
    } catch (e) {
      throw firebaseHandleException(e);
    }
  }
}
