import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessagingList extends StatelessWidget {
  const MessagingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InstaText(text: 'Messages'),
            InstaText(text: 'Requests'),
          ],
        ),
        const SizedBox(height: InstaSpacing.medium),
        Column(
          children: [
            InkWell(
              onTap: () {
                context.goNamed('messaging-chat', pathParameters: {'id': '1'});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _userDetails(),
                  _action(),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _userDetails() {
    return const Row(
      children: [
        InstaCircleAvatar(image: IconRes.testOnly),
        SizedBox(width: InstaSpacing.small),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstaText(
              text: 'user_name',
            ),
            InstaText(
              text: 'Active 4h ago',
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

  Widget _action() {
    return const InstaButton(
      buttonType: InstaButtonType.icon,
      assetName: IconRes.camera,
    );
  }
}