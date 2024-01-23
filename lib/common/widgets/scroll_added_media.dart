import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/scroll_behavior.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/dots_indicator.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollDisplayAddedMediaWidget extends ConsumerWidget {
  const ScrollDisplayAddedMediaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final state = ref.watch(addPostNotifierProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: InstaSpacing.small,
            horizontal: kIsWeb ? InstaSpacing.extraLarge : 0,
          ),
          child: Container(
            width: double.infinity,
            height: 350.0,
            decoration: BoxDecoration(
              color: applyColor[InstaColor.primary]!,
            ),
            child: ScrollConfiguration(
              behavior: InstaScrollBehavior(),
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: pageController,
                children: state.mediaFileList?.isNotEmpty ?? false
                    ? List.generate(state.mediaFileList!.length, (index) {
                        return kIsWeb
                            ? Image.network(
                                state.mediaFileList![index].path,
                              )
                            : Image.file(
                                File(
                                  state.mediaFileList![index].path,
                                ),
                              );
                      })
                    : List.generate(
                        state.droppedImages!.length,
                        (index) => Image.network(
                          state.droppedImages![index].url,
                        ),
                      ),
              ),
            ),
          ),
        ),
        InstaDotsIndicator(
          dotHeight: InstaSpacing.extraSmall,
          controller: pageController,
          count: state.mediaFileList != null
              ? state.mediaFileList?.length ?? 0
              : state.droppedImages?.length ?? 0,
        ),
      ],
    );
  }
}
