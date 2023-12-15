import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/dots_indicator.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddedMediaWidget extends ConsumerWidget {
  AddedMediaWidget({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildDisplayAddedMedia(ref);
  }

  Widget _buildDisplayAddedMedia(WidgetRef ref) {
    final mediaFileList = ref.watch(addPostNotifierProvider).mediaFileList;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: InstaSpacing.small,
            horizontal: InstaSpacing.extraLarge,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 300.0,
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              // children: List.generate(droppedFiles!.length,
              //     (index) => Image.network(droppedFiles[index].url)),
              children: List.generate(mediaFileList!.length,
                  (index) => Image.network(mediaFileList[index].path)),
            ),
          ),
        ),
        InstaDotsIndicator(
          controller: _pageController,
          // count: droppedFiles.length,
          count: mediaFileList.length,
        ),
      ],
    );
  }
}
