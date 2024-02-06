import 'package:cj_flutter_riverpod_instagram_clone/model/dropped_file.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/provider/add_post_provider.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController {
  final WidgetRef ref;

  AddPostController({required this.ref});

  final ImagePicker _picker = ImagePicker();

  //! START - For mobile and web when picking images from gallery and file
  Future<void> pickImages() async {
    final updateState = ref.read(addPostProvider.notifier);
    try {
      final pickedFileList = await _picker.pickMultiImage();

      updateState.pickMediaFileList(pickedFileList);
    } catch (e) {
      updateState.pickErrorMessage(e.toString());
    }
  }
  //! END - For mobile and web when picking images from gallery and file

  //! START - For mobile when picking a video from gallery
  Future<void> pickVideo() async {
    List<XFile> video = [];
    final updateState = ref.read(addPostProvider.notifier);

    try {
      final pickedFileList =
          await _picker.pickVideo(source: ImageSource.gallery);
      video.add(pickedFileList!);
      updateState.pickMediaFileList(video);
    } catch (e) {
      updateState.pickErrorMessage(e.toString());
    }
  }
  //! END - For mobile when picking a video from gallery

  void removeMedia(int index) {
    final updateState = ref.read(addPostProvider.notifier);
    final state = ref.watch(addPostProvider);

    if (state.mediaFileList != null) {
      state.mediaFileList?.removeAt(index);
      updateState.pickMediaFileList(state.mediaFileList!);
    }

    int? length = state.mediaFileList?.length ?? 0;
    int? newIndex;

    if (state.previewImageIndex == length && length != 0) {
      newIndex = state.previewImageIndex - 1;
    } else {
      newIndex = state.previewImageIndex;
    }

    if (state.mediaFileList?.isNotEmpty ?? false) {
      ref
          .read(addPostProvider.notifier)
          .pickPreviewImage(state.mediaFileList![newIndex], newIndex);
    }
  }

  //! START - For web when dropping images
  Future<void> droppedImages(
    dynamic event,
    DropzoneViewController dropZoneController,
  ) async {
    final updateState = ref.read(addPostProvider.notifier);

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

    updateState.pickDroppedImages(
        [...ref.watch(addPostProvider).droppedImages ?? [], droppedImage]);
  }

  //! END - For web when dropping images
}
