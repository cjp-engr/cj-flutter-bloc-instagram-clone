import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/widgets/aspect_ratio_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends ConsumerWidget {
  final int index;
  const VideoPlayerWidget(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaFileList = ref.watch(addPostNotifierProvider).mediaFileList;
    final VideoPlayerController controller =
        VideoPlayerController.file(File(mediaFileList![index].path));
    controller.initialize();
    controller.setLooping(true);
    controller.play();
    return Center(child: AspectRatioVideoWidget(controller));
  }
}
