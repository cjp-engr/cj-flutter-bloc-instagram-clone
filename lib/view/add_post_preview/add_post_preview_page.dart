import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_media_list_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_media_selected_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/remove_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddPostPreviewPage extends ConsumerWidget {
  const AddPostPreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InstaAppBar(
      appBarTitle: const InstaText(
        text: 'Sorting and Deletion Page',
        fontSize: InstaFontSize.large,
        fontWeight: FontWeight.bold,
      ),
      appBarLeading: const _BackButtonWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        child: const Column(
          children: [
            PreviewMediaSelectedWidget(),
            PreviewMediaListWidget(),
          ],
        ),
      ),
      floatingActionButton: const RemovePostWidget(),
    );
  }
}

class _BackButtonWidget extends ConsumerWidget {
  const _BackButtonWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SecondaryButton(
      assetName: IconRes.back,
      scale: 3,
      onPressed: () => context.goNamed(InstaRouteNames.addPost),
    );
  }
}
