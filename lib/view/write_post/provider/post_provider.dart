import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cj_flutter_riverpod_instagram_clone/repository/image/image_repository_provider.dart';

part 'post_provider.g.dart';

@Riverpod(keepAlive: false)
class Post extends _$Post {
  @override
  FutureOr<void> build() {}

  Future<void> addPost(ImageDetails details) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(
      () => ref.read(imageRepositoryProvider).addImageSet(details),
    );
  }
}
