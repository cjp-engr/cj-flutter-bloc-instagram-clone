import 'package:cj_flutter_riverpod_instagram_clone/model/dropped_file.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController {
  final WidgetRef ref;

  AddPostController({required this.ref});

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImages() async {
    final updateState = ref.read(addPostNotifierProvider.notifier);
    try {
      final pickedFileList = await _picker.pickMultiImage();

      updateState.pickMediaFileList(pickedFileList);
    } catch (e) {
      updateState.pickErrorMessage(e.toString());
    }
  }

  Future<void> pickVideo(ImageSource source) async {
    List<XFile> video = [];
    final updateState = ref.read(addPostNotifierProvider.notifier);

    try {
      final pickedFileList = await _picker.pickVideo(source: source);
      video.add(pickedFileList!);
      updateState.pickMediaFileList(video);
    } catch (e) {
      updateState.pickErrorMessage(e.toString());
    }
  }

  Future<void> droppedImages(
    dynamic event,
    DropzoneViewController dropZoneController,
  ) async {
    final updateState = ref.read(addPostNotifierProvider.notifier);

    final name = event.name;
    final mime = await dropZoneController.getFileMIME(event);
    final bytes = await dropZoneController.getFileSize(event);
    final url = await dropZoneController.createFileUrl(event);

    final droppedImage = DroppedFile(
      url: url,
      name: name,
      mime: mime,
      bytes: bytes,
    );

    updateState.pickDroppedImages([
      ...ref.watch(addPostNotifierProvider).droppedImages ?? [],
      droppedImage
    ]);
  }

  void removeMedia(int index) {
    final updateState = ref.read(addPostNotifierProvider.notifier);
    final mediaFileList = ref.watch(addPostNotifierProvider).mediaFileList;

    if (mediaFileList != null) {
      mediaFileList.removeAt(index);
      updateState.pickMediaFileList(mediaFileList);
    }
  }
}
