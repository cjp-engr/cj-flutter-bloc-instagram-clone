import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class NotificationSuggested extends StatelessWidget {
  const NotificationSuggested({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InstaText(text: 'Suggested for you'),
        const SizedBox(height: InstaSpacing.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _details(),
            _actions(),
          ],
        ),
      ],
    );
  }

  Widget _details() {
    return const Row(
      children: [
        InstaCircleAvatar(
          image: IconRes.testOnly,
          radius: InstaCircleAvatarSize.medium,
        ),
        SizedBox(width: InstaSpacing.verySmall),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstaText(text: 'user_name'),
            InstaText(text: 'Suggested for you')
          ],
        )
      ],
    );
  }

  Widget _actions() {
    return Row(
      children: [
        InstaButton(
          buttonType: InstaButtonType.seconday,
          text: 'Follow',
          onPressed: () {},
        ),
        const InstaButton(
          buttonType: InstaButtonType.icon,
          assetName: IconRes.menuVertical,
        ),
      ],
    );
  }
}
