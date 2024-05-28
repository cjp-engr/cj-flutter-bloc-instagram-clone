import 'dart:async';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_constant.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/firebase_exception.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_comment.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentRepository {
  final _userCollection = FirebaseFirestore.instance.collection('users');

  CollectionReference<Map<String, dynamic>> _commentCollection({
    String? commenterId,
    String? recipientId,
    required String imagesId,
  }) {
    return _userCollection
        .doc(commenterId ?? recipientId)
        .collection('images')
        .doc(imagesId)
        .collection('comments');
  }

  //! START - Add comment operation to images
  Future<ImageComment?> addImagesComment(ImageComment d) async {
    String commenterId = fbAuth.currentUser!.uid;
    int dateCreated = DateTime.now().millisecondsSinceEpoch;
    String commentId = '';

    final commenter = await _getCommenterDetails(commenterId);

    try {
      await _commentCollection(commenterId: commenterId, imagesId: d.imagesId!)
          .add({
        'commenterId': commenterId,
        'dateCreated': dateCreated,
        'imagesId': d.imagesId,
        'comment': d.comment,
        'recipientId': d.recipientId,
      }).then((value) async {
        commentId = value.id;
      });
      return d.copyWith(
        id: commentId,
        commenterId: commenterId,
        commenterImage: commenter!.imageUrl,
        commenterUsername: commenter.userName,
        timeDifference: '0s',
      );
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
    return null;
  }

  //! START - Read operation
  FutureOr<List<ImageComment>?> getComments({
    required String recipientId,
    required String imagesId,
  }) async {
    List<ImageComment> commentDetails = [];
    try {
      QuerySnapshot comments = await _commentCollection(
        recipientId: recipientId,
        imagesId: imagesId,
      ).get();

      for (var comment in comments.docs) {
        var data = comment.data() as Map<String, dynamic>;

        final commenter = await _getCommenterDetails(data['commenterId']);
        commentDetails.add(
          ImageComment(
            imagesId: data['imagesId'],
            recipientId: data['recipientId'],
            commenterId: data['commenterId'],
            commenterImage: commenter!.imageUrl,
            commenterUsername: commenter.userName,
            timeDifference: '',
            comment: data['comment'],
          ),
        );
      }
      return commentDetails;
    } on FirebaseException catch (e) {
      firebaseHandleException(e);
    } catch (e) {
      firebaseHandleException(e);
    }
    return null;
  }

  FutureOr<UserDetails?> _getCommenterDetails(String id) async {
    try {
      final DocumentSnapshot userDoc = await _userCollection.doc(id).get();
      final data = userDoc.data() as Map<String, dynamic>?;
      if (userDoc.exists) {
        return UserDetails(
          userName: data!['userName'],
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
}
