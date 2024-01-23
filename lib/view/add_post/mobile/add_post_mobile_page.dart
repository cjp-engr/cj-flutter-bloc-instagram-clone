import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/add_post_button_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_media_list_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_selected_media_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/remove_post_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddPostMobilePage extends StatelessWidget {
  const AddPostMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: const InstaText(
        text: 'New Post',
        fontSize: InstaFontSize.large,
        fontWeight: FontWeight.bold,
      ),
      appBarActions: const [
        NextButton(),
      ],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        child: const Column(
          children: [
            PreviewSelectedMediaWidget(),
            AddPostButtonWidget(),
            PreviewMediaListWidget(),
          ],
        ),
      ),
      floatingActionButton: const RemovePostWidget(),
    );
  }
}

class NextButton extends ConsumerWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPostNotifierProvider);
    final hasMedia = state.mediaFileList?.isNotEmpty ??
        false || (state.droppedImages?.isNotEmpty ?? false);
    return hasMedia
        ? InkWell(
            onTap: () => context.goNamed(InstaRouteNames.writePost),
            child: InstaText(
              text: 'Next',
              color: applyColor[InstaColor.secondary],
            ),
          )
        : const SizedBox();
  }
}
