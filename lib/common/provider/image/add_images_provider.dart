import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cj_flutter_riverpod_instagram_clone/repository/image/image_repository_provider.dart';

part 'add_images_provider.g.dart';

@riverpod
class AddImages extends _$AddImages {
  @override
  FutureOr<void> build() {}

  Future<void> addImages(ImageDetails details) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => ref.read(imageRepositoryProvider).addImagesSet(details),
    );

    state = await AsyncValue.guard(() async {
      await ref.read(imageRepositoryProvider).addImagesSet(details);
    });
  }
}
