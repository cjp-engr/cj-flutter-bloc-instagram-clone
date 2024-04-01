import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/dots_indicator.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/controller/add_post_controller.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/provider/add_post_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddedMediaMobileWidget extends ConsumerWidget {
  const AddedMediaMobileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isIos = defaultTargetPlatform == TargetPlatform.iOS;

    final state = ref.watch(addPostProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: InstaSpacing.small,
            horizontal: kIsWeb ? InstaSpacing.extraLarge : 0,
          ),
          child: Container(
            width: double.infinity,
            height: 300.0,
            decoration: BoxDecoration(
              color: applyColor[InstaColor.primary]!,
            ),
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: pageController,
              children: List.generate(state.mediaFileList!.length, (index) {
                return kIsWeb && (!isAndroid || !isIos)
                    ? Image.network(
                        state.mediaFileList![index].path,
                      )
                    : Stack(
                        children: [
                          Center(
                            child: Image.file(
                              File(
                                state.mediaFileList![index].path,
                              ),
                            ),
                          ),
                          _buildRemoveButton(ref, state.previewImageIndex),
                        ],
                      );
              }),
            ),
          ),
        ),
        state.mediaFileList!.length <= 1
            ? const SizedBox()
            : InstaDotsIndicator(
                controller: pageController,
                count: state.mediaFileList?.length ?? 0,
              ),
      ],
    );
  }

  Widget _buildRemoveButton(WidgetRef ref, int previewIndex) {
    final controller = AddPostController(ref: ref);

    return InkWell(
      onTap: () {
        controller.removeMedia(previewIndex);
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(InstaSpacing.extraSmall),
          child: Image.asset(
            IconRes.delete,
            color: applyColor[InstaColor.alert],
            scale: 3.5,
          ),
        ),
      ),
    );
  }
}
