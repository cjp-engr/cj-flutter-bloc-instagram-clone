// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/comment_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

class HomeState {
  final ImageDetails? imageDetails;
  final List<CommentImages>? comments;

  HomeState({
    this.imageDetails,
    this.comments,
  });

  HomeState copyWith({
    ImageDetails? imageDetails,
    List<CommentImages>? comments,
  }) {
    return HomeState(
      imageDetails: imageDetails ?? this.imageDetails,
      comments: comments ?? this.comments,
    );
  }
}
