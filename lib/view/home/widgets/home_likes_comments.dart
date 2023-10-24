import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeLikesComments extends StatelessWidget {
  const HomeLikesComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InstaText(text: '1,1135 likes'),
        const InstaText(text: 'user_name test test test'),
        InkWell(
            child: const InstaText(text: 'View all 1,447 comments'),
            onTap: () {}),
        const SizedBox(height: InstaSpacing.extraSmall),
        Row(
          children: [
            const InstaCircleAvatar(
              image: IconRes.testOnly,
              radius: InstaCircleAvatarSize.small,
            ),
            const SizedBox(width: InstaSpacing.extraSmall),
            InkWell(
              child: const InstaText(
                text: 'Add a comment...',
                color: Colors.grey,
              ),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
