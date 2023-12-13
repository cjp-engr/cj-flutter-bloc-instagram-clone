import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController {
  final WidgetRef ref;

  AddPostController({required this.ref});

  final ImagePicker _picker = ImagePicker();

  Future<void> selectMedia() async {
    final updateState = ref.read(addPostNotifierProvider.notifier);
    try {
      final pickedFileList = await _picker.pickMultipleMedia();

      updateState.pickMediaFileList(pickedFileList);
    } catch (e) {
      updateState.pickErrorMessage(e.toString());
    }
  }
}
