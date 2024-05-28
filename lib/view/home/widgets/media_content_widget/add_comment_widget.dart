// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/comment_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/display_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/modal_bottom_sheet.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_comment.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

class AddCommentWidget extends StatelessWidget {
  final ImageDetails details;
  const AddCommentWidget({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _ImageAvatarWidget(),
        const SizedBox(width: InstaSpacing.medium),
        _ShowCommentsWidget(details),
      ],
    );
  }
}

class _ImageAvatarWidget extends ConsumerWidget {
  const _ImageAvatarWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(displayUserDetailsProvider);
    return user.when(
      data: (data) {
        return InstaCircleAvatar(
          image: data?.imageUrl ?? IconRes.testOnly,
          radius: InstaCircleAvatarSize.small,
        );
      },
      error: (error, stackTrace) => const Text('there is an error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class _ShowCommentsWidget extends ConsumerStatefulWidget {
  final ImageDetails details;
  const _ShowCommentsWidget(
    this.details,
  );

  @override
  ConsumerState<_ShowCommentsWidget> createState() =>
      _ShowCommentsWidgetState();
}

class _ShowCommentsWidgetState extends ConsumerState<_ShowCommentsWidget> {
  final _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: InstaText(
        text: AppLocalizations.of(context)!.addAComment,
        color: applyColor[InstaColor.disabled],
      ),
      onTap: () async {
        ref.read(commentImagesProvider.notifier).getComments(
              recipientId: widget.details.userId!,
              imagesId: widget.details.imagesId!,
            );
        showCustomBottomSheet(context, widget: _displayBottomSheet());
      },
    );
  }

  Widget _displayBottomSheet() {
    return Column(
      children: [
        const InstaText(text: 'Comments', fontWeight: FontWeight.bold),
        Padding(
          padding: const EdgeInsets.all(InstaSpacing.extraSmall),
          child: Column(
            children: [
              _DescriptionWidget(widget.details),
              const SizedBox(height: InstaSpacing.large),
              SizedBox(
                height: context.screenHeight / 2.5,
                child: const _DisplayCommentWidget(),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InstaTextField(
                label: 'Add a comment for username',
                controller: _commentController,
                onChanged: (value) {
                  _commentController.text == value;
                },
                color: Colors.transparent,
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(IconRes.testOnly),
                    radius: InstaCircleAvatarSize.verySmall,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(InstaSpacing.tiny),
                  child: TertiaryButton(
                      text: '',
                      width: InstaSpacing.tiny,
                      height: InstaSpacing.verySmall,
                      scale: 3.5,
                      color: applyColor[InstaColor.secondary],
                      assetName: IconRes.arrowUp,
                      onPressed: () async {
                        ref.read(commentImagesProvider.notifier).addComment(
                              ImageComment(
                                comment: _commentController.text.trim(),
                                imagesId: widget.details.imagesId,
                                recipientId: widget.details.userId,
                              ),
                            );
                        _commentController.clear();
                      }),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DescriptionWidget extends ConsumerWidget {
  final ImageDetails details;
  const _DescriptionWidget(
    this.details,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        InstaCircleAvatar(
          image: details.userImage!,
          radius: InstaCircleAvatarSize.small,
        ),
        const SizedBox(width: InstaSpacing.small),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstaText(
              text: details.userName!,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold,
            ),
            InstaText(
              text: details.description!,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}

class _DisplayCommentWidget extends ConsumerWidget {
  const _DisplayCommentWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comment = ref.watch(commentImagesProvider);
    return comment.when(
      data: (data) {
        return ListView.builder(
          itemCount: data?.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: InstaSpacing.extraSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InstaCircleAvatar(
                    image: data![index].commenterImage!,
                    radius: InstaCircleAvatarSize.small,
                  ),
                  const SizedBox(width: InstaSpacing.small),
                  SizedBox(
                    width: context.screenWidth / 1.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InstaText(
                              text: data[index].commenterUsername ?? '',
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: InstaSpacing.extraSmall,
                            ),
                            InstaText(
                                text: data[index].timeDifference ?? '',
                                textAlign: TextAlign.start,
                                color: applyColor[InstaColor.disabled]),
                          ],
                        ),
                        InstaText(
                          text: data[index].comment ?? '',
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return const Text('there is an error');
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
