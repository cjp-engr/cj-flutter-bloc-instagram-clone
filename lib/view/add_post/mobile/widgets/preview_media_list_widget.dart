import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mime/mime.dart';

class PreviewMediaListWidget extends ConsumerWidget {
  const PreviewMediaListWidget({super.key});

  final int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPostNotifierProvider);
    if (state.mediaFileList?.isNotEmpty ?? false) {
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
          itemCount: state.mediaFileList?.length ?? 0,
          itemBuilder: (context, index) {
            final mime = lookupMimeType(state.mediaFileList![index].path);

            return ProviderScope(
              overrides: [previewMediaIndexProvider.overrideWithValue(index)],
              child: Semantics(
                label: 'image_picker_example_picked_image',
                child: (mime == null || mime.startsWith('image/')
                    ? const ImageListWidget()
                    : const VideoPlayerWidget()),
              ),
            );
          },
        ),
      );
    } else {
      return const Column(
        children: [
          SizedBox(height: InstaSpacing.extraLarge * 3.2),
          InstaText(text: 'You have not yet picked an image.'),
        ],
      );
    }
  }
}

class ImageListWidget extends ConsumerWidget {
  const ImageListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPostNotifierProvider);
    final index = ref.watch(previewMediaIndexProvider);
    return GestureDetector(
      onTap: () {
        ref
            .read(addPostNotifierProvider.notifier)
            .pickPreviewImage(state.mediaFileList![index], index);
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
                child: _image(state.mediaFileList![index].path),
              ),
            )
          : SizedBox(
              child: _image(state.mediaFileList![index].path),
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
