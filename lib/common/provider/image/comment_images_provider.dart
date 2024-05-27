import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_comment.dart';
import 'package:cj_flutter_riverpod_instagram_clone/repository/comment/comment_repository_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_images_provider.g.dart';

@Riverpod(keepAlive: true)
class CommentImages extends _$CommentImages {
  @override
  FutureOr<List<ImageComment>?> build() {
    return Future<List<ImageComment>?>.value(null);
  }

  Future<void> addComment(ImageComment details) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final image =
          await ref.read(commentRepositoryProvider).addImagesComment(details);
      List<ImageComment>? list = [
        ...state.value ?? [],
        image ?? const ImageComment()
      ];
      //TODO
      // list.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));

      return list;
    });
  }
}
