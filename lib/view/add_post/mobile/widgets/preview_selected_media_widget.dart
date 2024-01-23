import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreviewSelectedMediaWidget extends ConsumerWidget {
  const PreviewSelectedMediaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPostNotifierProvider);

    return Container(
      width: double.infinity,
      height: context.screenHeight / 2.5,
      color: applyColor[InstaColor.transparent],
      child: state.previewImage == null &&
              (state.mediaFileList?.isNotEmpty ?? false)
          ? Image.file(
              File(state.mediaFileList![0].path),
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return _errorText();
              },
            )
          : (state.previewImage?.path.isNotEmpty ?? false) &&
                  (state.mediaFileList?.isNotEmpty ?? false)
              ? Image.file(
                  File(state.mediaFileList![state.previewImageIndex].path),
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return _errorText();
                  },
                )
              : SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconRes.emptyGallery,
                        color: applyColor[InstaColor.disabled],
                        scale: 0.9,
                      ),
                      const SizedBox(height: InstaSpacing.medium),
                      InstaText(
                        text: 'Pick an image or video',
                        color: applyColor[InstaColor.disabled],
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
    );
  }

  Widget _errorText() =>
      const InstaText(text: 'This image type is not supported');
}
