// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'image_repository.dart';

part 'image_repository_provider.g.dart';

@riverpod
ImageRepository imageRepository(ImageRepositoryRef ref) {
  return ImageRepository();
}
