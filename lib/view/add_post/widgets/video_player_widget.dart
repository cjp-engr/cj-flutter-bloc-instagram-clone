import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/provider/add_post_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/widgets/aspect_ratio_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends ConsumerWidget {
  const VideoPlayerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaFileList = ref.watch(addPostProvider).mediaFileList;
    final index = ref.watch(previewMediaIndexProvider);
    final VideoPlayerController controller =
        VideoPlayerController.file(File(mediaFileList![index].path));
    controller.initialize();
    controller.setLooping(true);
    controller.play();
    return Center(child: AspectRatioVideoWidget(controller));
  }
}
