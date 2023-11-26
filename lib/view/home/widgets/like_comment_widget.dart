import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class LikeAndCommentWidget extends StatelessWidget {
  const LikeAndCommentWidget({super.key});

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
    return const InstaText(text: '1,1135 likes');
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
        child: const InstaText(text: 'View all 1,447 comments'), onTap: () {});
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
      child: const InstaText(
        text: 'Add a comment...',
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
