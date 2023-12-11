import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController {
  final WidgetRef ref;
  final ImagePicker _picker = ImagePicker();

  AddPostController({required this.ref});

  Future<void> selectMedia() async {
    try {
      final pickedFileList = await _picker.pickMultipleMedia();
      ref
          .read(addPostNotifierProvider.notifier)
          .getMediaFileList(pickedFileList);
    } catch (e) {
      ref.watch(addPostNotifierProvider.notifier).getErrorMessage(e.toString());
    }
  }
}
