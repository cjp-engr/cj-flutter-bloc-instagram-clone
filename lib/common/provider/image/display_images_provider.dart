import 'dart:async';

import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/repository/image/image_repository_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'display_images_provider.g.dart';

@Riverpod(keepAlive: true)
class DisplayImages extends _$DisplayImages {
  @override
  FutureOr<List<ImageDetails>?> build() {
    return Future<List<ImageDetails>?>.value(null);
  }

  Future<void> getImages() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final images = await ref.read(imageRepositoryProvider).getImagesSet();
      return images;
    });
  }
}
