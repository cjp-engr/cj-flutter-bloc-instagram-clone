import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/comment_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/provider/home_state.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class Home extends _$Home {
  @override
  HomeState build() {
    return HomeState();
  }

  Future<void> getComments(List<CommentImages> comments) async {
    state = state.copyWith(comments: comments);
  }

  Future<void> getImageDetails(ImageDetails details) async {
    state = state.copyWith(imageDetails: details);
  }
}
