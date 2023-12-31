import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreviewSelectedImageWidget extends ConsumerWidget {
  const PreviewSelectedImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPostNotifierProvider);
    return Container(
      width: double.infinity,
      height: context.screenHeight / 2.5,
      color: Colors.transparent,
      child: state.mediaFileList == null
          ? const SizedBox()
          : Image.file(
              File(state.previewImage?.path ?? state.mediaFileList![0].path),
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return const InstaText(
                    text: 'This image type is not supported');
              },
            ),
    );
  }
}
