import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mime/mime.dart';

class PreviewImageListWidget extends ConsumerStatefulWidget {
  const PreviewImageListWidget({super.key});

  @override
  ConsumerState<PreviewImageListWidget> createState() =>
      _PreviewMediaListWidgetState();
}

class _PreviewMediaListWidgetState
    extends ConsumerState<PreviewImageListWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaFileList = ref.watch(addPostNotifierProvider).mediaFileList;
    if (mediaFileList != null) {
      return Semantics(
        label: 'image_picker_example_picked_images',
        child: GridView.builder(
          key: UniqueKey(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: mediaFileList.length,
          itemBuilder: (context, index) {
            final mime = lookupMimeType(mediaFileList[index].path);
            return Semantics(
              label: 'image_picker_example_picked_image',
              child: (mime == null || mime.startsWith('image/')
                  ? _buildImageDisplay(index, mediaFileList[index].path)
                  : VideoPlayerWidget(index)),
            );
          },
        ),
      );
    } else {
      return const InstaText(text: 'You have not yet picked an image.');
    }
  }

  Widget _buildImageDisplay(int index, String path) {
    return GestureDetector(
      onTap: () {
        ref.read(addPostNotifierProvider.notifier).pickPathImageSelected(path);
      },
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.9),
          BlendMode.dstATop,
        ),
        child: Image.file(
          File(path),
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const InstaText(text: 'This image type is not supported');
          },
        ),
      ),
    );
  }
}
