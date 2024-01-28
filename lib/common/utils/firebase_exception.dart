import 'package:firebase_auth/firebase_auth.dart';

String firebaseHandleException(e) {
  try {
    throw e;
  } on FirebaseAuthException catch (e) {
    return e.message!;
  } on FirebaseException catch (e) {
    return e.message!;
  } catch (e) {
    return e.toString();
  }
}
