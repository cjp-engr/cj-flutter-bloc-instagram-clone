import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddPostController {
  final WidgetRef ref;

  AddPostController({required this.ref});

  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _videoPlayerController;
  VideoPlayerController? _videoPlayerToBeDispose;
  String? _retrieveDataError;

  Future<void> selectMedia() async {
    final updateState = ref.read(addPostNotifierProvider.notifier);
    try {
      final pickedFileList = await _picker.pickMultipleMedia();

      updateState.pickMediaFileList(pickedFileList);
    } catch (e) {
      updateState.pickErrorMessage(e.toString());
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    final updateState = ref.read(addPostNotifierProvider.notifier);
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        updateState.checkVideo(true);
        await _playVideo(response.file);
      } else {
        updateState.checkVideo(false);

        if (response.files == null) {
          _setImageFileListFromFile(response.file);
        } else {
          updateState.pickMediaFileList(response.files!);
        }
      }
    } else {
      _retrieveDataError = response.exception!.code;
      if (kDebugMode) {
        print(_retrieveDataError);
      }
    }
  }

  void _setImageFileListFromFile(XFile? value) {
    ref
        .read(addPostNotifierProvider.notifier)
        .pickMediaFileList(<XFile>[value!]);
  }

  Future<void> _playVideo(XFile? file) async {
    if (file != null) {
      await disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.networkUrl(Uri.parse(file.path));
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _videoPlayerController = controller;

      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
    }
  }

  Future<void> disposeVideoController() async {
    if (_videoPlayerController != null) {
      await _videoPlayerController!.dispose();
    }
    _videoPlayerController = null;

    if (_videoPlayerToBeDispose != null) {
      await _videoPlayerToBeDispose!.dispose();
    }
    _videoPlayerToBeDispose = _videoPlayerController;
    _videoPlayerController = null;
  }
}
