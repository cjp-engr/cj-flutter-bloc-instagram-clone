import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/alert_dialog.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/scroll_added_media.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/write_post/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WritePostPage extends ConsumerStatefulWidget {
  const WritePostPage({super.key});

  @override
  ConsumerState<WritePostPage> createState() => _WritePostPageState();
}

class _WritePostPageState extends ConsumerState<WritePostPage> {
  @override
  Widget build(BuildContext context) {
    _addPostListener();
    return InstaAppBar(
      appBarActions: const [
        _PostButtonWidget(),
      ],
      body: Container(
        padding: const EdgeInsets.all(InstaSpacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScrollDisplayAddedMediaWidget(),
            const SizedBox(height: InstaSpacing.medium),
            InstaText(
              text: 'Write something...',
              color: applyColor[InstaColor.disabled],
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: InstaSpacing.extraSmall),
            const InstaTextField(
              label: '',
              maxLines: 4,
            ),
          ],
        ),
      ),
      appBarLeading: const _BackButtonWidget(),
    );
  }

  void _addPostListener() {
    ref.listen<AsyncValue<void>>(
      postProvider,
      (prev, next) {
        next.whenOrNull(
          error: (e, st) {
            showAlertDialog(
              context,
              title: e.toString(),
              buttonCancelText: 'OK',
            );
          },
        );
      },
    );
  }
}

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SecondaryButton(
          assetName: IconRes.back,
          scale: 3.5,
          onPressed: () {
            context.goNamed(InstaRouteNames.addPost);
          }),
    );
  }
}

class _PostButtonWidget extends ConsumerStatefulWidget {
  const _PostButtonWidget();

  @override
  ConsumerState<_PostButtonWidget> createState() => _PostButtonWidgetState();
}

class _PostButtonWidgetState extends ConsumerState<_PostButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(postProvider);

    return postState.maybeWhen(
      orElse: () => InkWell(
        onTap: _submit,
        child: InstaText(
          text: 'Post',
          color: applyColor[InstaColor.secondary],
        ),
      ),
      loading: () => CircularProgressIndicator(
        color: applyColor[InstaColor.secondary],
      ),
    );
  }

  void _submit() {
    final images = ref.watch(addPostNotifierProvider).mediaFileList;
    final path = <String>[];
    if (images?.isNotEmpty ?? false) {
      for (var i = 0; i < images!.length; i++) {
        path.add(images[i].path);
      }
    }

    ref.read(postProvider.notifier).addPost(
          ImageDetails(
            images: path,
            description: 'Hardcoded description only!!!',
            comments: [
              'Hardcoded comments only!!! 0',
              'Hardcoded comments only!!! 1',
              'Hardcoded comments only!!! 2',
              'Hardcoded comments only!!! 3',
            ],
          ),
        );
  }
}
