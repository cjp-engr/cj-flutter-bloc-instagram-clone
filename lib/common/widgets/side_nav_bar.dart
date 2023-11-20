import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/app_route_name.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InstaSideNavBar extends StatelessWidget {
  const InstaSideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          InstaButton(
            assetName: IconRes.home,
            buttonType: InstaButtonType.icon,
            onPressed: () {
              context.go(AppRouteName.home);
            },
          ),
          InstaButton(
            assetName: IconRes.notification,
            buttonType: InstaButtonType.icon,
            onPressed: () {
              context.go(AppRouteName.notification);
            },
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
              context.go(AppRouteName.messagingList);
            },
          ),
          // _profileIcon(context)
        ],
      ),
    );
  }
}
