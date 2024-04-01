import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_post/provider/edit_post_state.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_post_provider.g.dart';

@Riverpod(keepAlive: true)
class EditPost extends _$EditPost {
  @override
  EditPostState build() {
    return EditPostState();
  }

  void pickErrorMessage(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }

  void displayImages(ImageDetails details) {
    state = state.copyWith(images: details);
  }
}

@Riverpod(dependencies: [])
String previewEditMediaId(PreviewEditMediaIdRef ref) {
  throw UnimplementedError();
}
