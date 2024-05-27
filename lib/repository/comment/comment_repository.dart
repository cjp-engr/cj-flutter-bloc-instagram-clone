import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentRepository {
  String get _commenterId => fbAuth.currentUser!.uid;
  CollectionReference<Map<String, dynamic>> commentCollection(String imagesId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(_commenterId)
        .collection('images')
        .doc(imagesId)
        .collection('comments');
  }

  //! START - Add comment operation to images
  Future<ImageComment?> addImagesComment(ImageComment d) async {
    int dateCreated = DateTime.now().millisecondsSinceEpoch;
    String commentId = '';

    try {
      await commentCollection(d.imagesId!).add({
        'commenterId': _commenterId,
        'dateCreated': dateCreated,
        'imagesId': d.imagesId,
        'comment': d.comment,
        'recipientId': d.recipientId,
      }).then((value) async {
        commentId = value.id;
      });
      return d.copyWith(
        id: commentId,
        commenterId: _commenterId,
        dateCreated: dateCreated,
      );
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
    return null;
  }
}
