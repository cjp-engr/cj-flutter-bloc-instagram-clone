import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fbAuth = FirebaseAuth.instance;
final fbUserId = fbAuth.currentUser!.uid;
final storageReference = FirebaseStorage.instance.ref();
