import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/comment_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/display_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/modal_bottom_sheet.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_comment.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCommentWidget extends ConsumerStatefulWidget {
  final ImageDetails details;
  const AddCommentWidget({
    super.key,
    required this.details,
  });

  @override
  ConsumerState<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends ConsumerState<AddCommentWidget> {
  final _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _displayAvatar(),
        const SizedBox(width: InstaSpacing.extraSmall),
        _displayAddComment(),
      ],
    );
  }

  Widget _displayAvatar() {
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

  Widget _displayAddComment() {
    return InkWell(
      child: InstaText(
        text: AppLocalizations.of(context)!.addAComment,
        color: applyColor[InstaColor.disabled],
      ),
      onTap: () {
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
              _displayDescription(),
              const SizedBox(height: InstaSpacing.large),
              _displayComment(),
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
                      }),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _displayDescription() {
    return const Row(
      children: [
        InstaCircleAvatar(
          image: IconRes.testOnly,
          radius: InstaCircleAvatarSize.small,
        ),
        SizedBox(width: InstaSpacing.extraSmall),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstaText(text: 'username'),
            InstaText(text: 'description description description'),
          ],
        ),
      ],
    );
  }

  Widget _displayComment() {
    return const Row(
      children: [
        InstaCircleAvatar(
          image: IconRes.testOnly,
          radius: InstaCircleAvatarSize.small,
        ),
        SizedBox(width: InstaSpacing.extraSmall),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstaText(text: 'commenterrrr'),
            InstaText(text: 'commenterrrr commenterrrr commenterrrr'),
          ],
        ),
      ],
    );
  }
}
