import 'package:flutter/material.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';

class StatusDetailsWidget extends StatelessWidget {
  const StatusDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        InstaCircleAvatar(
          image: IconRes.testOnly,
          radius: InstaCircleAvatarSize.small,
        ),
        SizedBox(width: InstaSpacing.small),
        Column(
          children: [
            InstaText(
              text: 'Carmen Palsario',
              fontWeight: FontWeight.w900,
            ),
            InstaText(
              text: 'Active yesterday',
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
