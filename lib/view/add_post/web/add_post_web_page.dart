import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/web/widgets/added_media_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/web/widgets/no_added_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPostWebPage extends ConsumerWidget {
  const AddPostWebPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaFileList = ref.watch(addPostNotifierProvider).mediaFileList;
    final droppedFiles = ref.watch(addPostNotifierProvider).droppedImages;
    return InstaAppBar(
        appBarTitle: Breakpoints.mediumAndUp.isActive(context)
            ? const SizedBox()
            : const InstaText(
                text: 'Instaclone',
                fontSize: InstaFontSize.veryLarge,
                fontWeight: FontWeight.bold,
              ),
        body: mediaFileList != null || droppedFiles != null
            ? const AddedMediaWidget()
            : const NoAddedMediaWidget());
  }
}
