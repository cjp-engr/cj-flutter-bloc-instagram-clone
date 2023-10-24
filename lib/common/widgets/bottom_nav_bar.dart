import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/app_route_name.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InstaBottomNavBar extends StatelessWidget {
  const InstaBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InstaButton(
            assetName: IconRes.home,
            buttonType: InstaButtonType.icon,
            onPressed: () {
              context.go(AppRouteName.home);
            },
          ),
          InstaButton(
            assetName: IconRes.heart,
            buttonType: InstaButtonType.icon,
            onPressed: () {},
          ),
          InstaButton(
            assetName: IconRes.newPost,
            buttonType: InstaButtonType.icon,
            onPressed: () {},
          ),
          InstaButton(
            assetName: IconRes.messenger,
            buttonType: InstaButtonType.icon,
            onPressed: () {
              context.go(AppRouteName.messaging);
            },
          ),
          _profileIcon(context)
        ],
      ),
    );
  }

  Widget _profileIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(AppRouteName.profile);
      },
      child: const InstaCircleAvatar(
        image: IconRes.testOnly,
        radius: InstaCircleAvatarSize.small,
      ),
    );
  }
}
