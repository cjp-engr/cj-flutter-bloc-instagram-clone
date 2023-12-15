import 'package:cj_flutter_riverpod_instagram_clone/model/dropped_file.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
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

  Future<void> droppedFile(
      dynamic event, DropzoneViewController dropZoneController) async {
    final name = event.name;
    final mime = await dropZoneController.getFileMIME(event);
    final bytes = await dropZoneController.getFileSize(event);
    final url = await dropZoneController.createFileUrl(event);

    final droppedFile = DroppedFile(
      url: url,
      name: name,
      mime: mime,
      bytes: bytes,
    );

    ref.read(addPostNotifierProvider.notifier).pickDroppedFiles(droppedFile);
  }
}
