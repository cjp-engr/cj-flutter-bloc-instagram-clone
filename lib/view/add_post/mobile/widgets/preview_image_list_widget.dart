import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class PreviewImageListWidget extends ConsumerStatefulWidget {
  const PreviewImageListWidget({super.key});

  final int selectedImageIndex = 0;

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
                  ? _buildImageDisplay(index, mediaFileList[index])
                  : VideoPlayerWidget(index)),
            );
          },
        ),
      );
    } else {
      return const InstaText(text: 'You have not yet picked an image.');
    }
  }

  Widget _buildImageDisplay(int index, XFile image) {
    return GestureDetector(
      onTap: () {
        ref
            .read(addPostNotifierProvider.notifier)
            .pickPreviewImage(image, index);
      },
      child: index == ref.watch(addPostNotifierProvider).previewImageIndex
          ? Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: const BorderRadius.all(
                  Radius.circular(InstaBorderRadius.small),
                ),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.3),
                  BlendMode.darken,
                ),
                child: _image(image.path),
              ),
            )
          : SizedBox(
              child: _image(image.path),
            ),
    );
  }

  Widget _image(String path) {
    return Image.file(
      File(path),
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return const InstaText(text: 'This image type is not supported');
      },
    );
  }
}
