import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

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
      });
    } catch (e) {
      // throw handleException(e);
      print(e.toString());
    }
  }

  Future<fb_auth.User?> signin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await fbAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(response.user);
      return response.user;
    } on fb_auth.FirebaseAuthException catch (e) {
      // throw handleException(e);
      print(e.toString());
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await fbAuth.signOut();
    } catch (e) {
      // throw handleException(e);
      print(e.toString());
    }
  }
}
