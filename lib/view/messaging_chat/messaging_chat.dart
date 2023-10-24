import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class MessagingChatPage extends StatelessWidget {
  const MessagingChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: const Row(
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
      ),
    );
  }
}
