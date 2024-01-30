import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/alert_dialog.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/scroll_added_media.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/provider/add_post_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/widgets/select_dialog_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/write_post/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddPostWidget extends ConsumerStatefulWidget {
  const AddPostWidget({super.key});

  @override
  ConsumerState<AddPostWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends ConsumerState<AddPostWidget> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addPostProvider);
    _addPostListener();
    return InstaAppBar(
      appBarActions: const [
        _PostButtonWidget(),
      ],
      body: Column(
        children: [
          const _ActionButtonsWidget(),
          Container(
            padding: const EdgeInsets.all(InstaSpacing.small),
            child: state.mediaFileList?.isNotEmpty ?? false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ScrollDisplayAddedMediaWidget(),
                      const SizedBox(height: InstaSpacing.extraLarge),
                      GestureDetector(
                        onTap: () {},
                        child: InstaText(
                          text: 'Write something...',
                          color: applyColor[InstaColor.disabled],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  )
                : const _NoImageWidget(),
          ),
        ],
      ),
    );
  }

  void _addPostListener() {
    ref.listen<AsyncValue<void>>(
      postProvider,
      (prev, next) {
        next.whenOrNull(
          data: (data) {
            context.goNamed(InstaRouteNames.home);
            ref.invalidate(addPostProvider);
          },
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

class _NoImageWidget extends StatelessWidget {
  const _NoImageWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screenHeight / 2.5,
      color: applyColor[InstaColor.transparent],
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
    );
  }
}

class _ActionButtonsWidget extends StatelessWidget {
  const _ActionButtonsWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(InstaSpacing.small),
          child: SecondaryButton(
            assetName: IconRes.gallery,
            scale: 2,
            onPressed: () {
              showSelectDialog(context, title: 'Select to upload');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(InstaSpacing.small),
          child: SecondaryButton(
            assetName: IconRes.adjust,
            scale: 2.7,
            onPressed: () => context.goNamed(InstaRouteNames.addPostPreview),
          ),
        )
      ],
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
    final images = ref.watch(addPostProvider).mediaFileList;
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
