import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LikeAndCommentWidget extends StatefulWidget {
  const LikeAndCommentWidget({super.key});

  @override
  State<LikeAndCommentWidget> createState() => _LikeAndCommentWidgetState();
}

class _LikeAndCommentWidgetState extends State<LikeAndCommentWidget> {
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
        _buildAddComment(),
      ],
    );
  }

  Widget _buildLike() {
    return InstaText(text: AppLocalizations.of(context)!.likesCount(1234));
  }

  Widget _buildUserName() {
    return const InstaText(text: 'user_name');
  }

  Widget _buildDescription() {
    return const InstaText(
        text:
            'description descriptiondescription descriptiondescription descriptiondescription descriptiondescription description',
        textAlign: TextAlign.start);
  }

  Widget _buildViewComment() {
    return InkWell(
        child: InstaText(
            text: AppLocalizations.of(context)!.viewAllCountComment(3000)),
        onTap: () {});
  }

  Widget _buildAddComment() {
    return Row(
      children: [
        _displayAvatar(),
        const SizedBox(width: InstaSpacing.extraSmall),
        _displayAddComment(),
      ],
    );
  }

  Widget _displayAvatar() {
    return const InstaCircleAvatar(
      image: IconRes.testOnly,
      radius: InstaCircleAvatarSize.small,
    );
  }

  Widget _displayAddComment() {
    return InkWell(
      child: InstaText(
        text: AppLocalizations.of(context)!.addAComment,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
