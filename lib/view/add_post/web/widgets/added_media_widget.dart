import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/dots_indicator.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddedMediaWidget extends ConsumerStatefulWidget {
  const AddedMediaWidget({super.key});

  @override
  ConsumerState<AddedMediaWidget> createState() => _AddedMediaWidgetState();
}

class _AddedMediaWidgetState extends ConsumerState<AddedMediaWidget> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return _buildDisplayAddedMedia();
  }

  Widget _buildDisplayAddedMedia() {
    final mediaFileList = ref.watch(addPostNotifierProvider).mediaFileList;
    final droppedFiles = ref.watch(addPostNotifierProvider).droppedFiles;

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
              children: mediaFileList != null
                  ? List.generate(mediaFileList.length, (index) {
                      return Image.network(mediaFileList[index].path);
                    })
                  : List.generate(droppedFiles!.length,
                      (index) => Image.network(droppedFiles[index].url)),
            ),
          ),
        ),
        InstaDotsIndicator(
          controller: _pageController,
          count: mediaFileList != null
              ? mediaFileList.length
              : droppedFiles?.length ?? 0,
        ),
      ],
    );
  }
}
