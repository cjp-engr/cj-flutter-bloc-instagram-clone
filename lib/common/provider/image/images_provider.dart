import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cj_flutter_riverpod_instagram_clone/repository/image/image_repository_provider.dart';

part 'images_provider.g.dart';

@riverpod
class Images extends _$Images {
  @override
  FutureOr<void> build() {}

  FutureOr<void> addImages(ImageDetails details) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => ref.read(imageRepositoryProvider).addImages(details),
    );
  }

  Future<void> deleteImages(String id) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => ref.read(imageRepositoryProvider).deleteImages(id),
    );
  }

  Future<void> updateImages(
      ImageDetails details, List<String> deleteImages) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () =>
          ref.read(imageRepositoryProvider).updateImages(details, deleteImages),
    );
  }
}
