import 'package:image_picker/image_picker.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_state.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_post_notifier.g.dart';

@riverpod
class AddPostNotifier extends _$AddPostNotifier {
  @override
  AddPostState build() {
    return const AddPostState();
  }

  void getMediaFileList(List<XFile> mediaFileList) {
    state = state.copyWith(mediaFileList: mediaFileList);
  }

  void getErrorMessage(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }
}
