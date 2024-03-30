import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/display_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsBlockWidget extends ConsumerStatefulWidget {
  final ImageDetails details;
  const DetailsBlockWidget({
    super.key,
    required this.details,
  });

  @override
  ConsumerState<DetailsBlockWidget> createState() => _DetailsBlockWidgetState();
}

class _DetailsBlockWidgetState extends ConsumerState<DetailsBlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLike(),
        _buildUserName(),
        _buildDescription(),
        _buildViewComment(),
        const SizedBox(height: InstaSpacing.extraSmall),
        const _AddCommentWidget(),
      ],
    );
  }

  Widget _buildLike() {
    return InstaText(text: AppLocalizations.of(context)!.likesCount(1234));
  }

  Widget _buildUserName() {
    return InstaText(
      text: widget.details.userName!,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _buildDescription() {
    return widget.details.description!.isEmpty
        ? const SizedBox()
        : InstaText(
            text: widget.details.description!, textAlign: TextAlign.start);
  }

  Widget _buildViewComment() {
    return InkWell(
        child: InstaText(
            text: AppLocalizations.of(context)!.viewAllCountComment(3000)),
        onTap: () {});
  }
}

class _AddCommentWidget extends ConsumerStatefulWidget {
  const _AddCommentWidget();

  @override
  ConsumerState<_AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends ConsumerState<_AddCommentWidget> {
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
      onTap: () {},
    );
  }
}
