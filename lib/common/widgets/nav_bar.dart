// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

class InstaNavigationBar extends StatelessWidget {
  final StatefulNavigationShell? navigationShell;
  const InstaNavigationBar({
    Key? key,
    this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('InstaNavigationBar'));

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('body_small'),
            builder: (_) => SizedBox(
              child: navigationShell,
            ),
          ),
        },
      ),
      bottomNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('body_small'),
            builder: (_) => _smallSizeNavigation(context),
          ),
        },
      ),
    );
  }

  Widget _smallSizeNavigation(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navigationShell!.currentIndex,
      onTap: (index) {
        navigationShell!.goBranch(
          index,
          initialLocation: index == navigationShell!.currentIndex,
        );
      },
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: _navigationList(context),
      selectedFontSize: 0,
      unselectedFontSize: 0,
      iconSize: 0,
    );
  }

  List<BottomNavigationBarItem> _navigationList(BuildContext context) {
    return [
      const BottomNavigationBarItem(
          icon: InstaButton(
            assetName: IconRes.home,
            buttonType: InstaButtonType.icon,
          ),
          label: ""),
      const BottomNavigationBarItem(
          icon: InstaButton(
            assetName: IconRes.notification,
            buttonType: InstaButtonType.icon,
          ),
          label: ""),
      const BottomNavigationBarItem(
          icon: InstaButton(
            assetName: IconRes.newPost,
            buttonType: InstaButtonType.icon,
          ),
          label: ""),
      const BottomNavigationBarItem(
          icon: InstaButton(
            assetName: IconRes.messenger,
            buttonType: InstaButtonType.icon,
          ),
          label: ""),
      BottomNavigationBarItem(
        icon: _profileIcon(context),
        label: "",
      ),
    ];
  }

  Widget _profileIcon(BuildContext context) {
    return const InkWell(
      child: InstaCircleAvatar(
        image: IconRes.testOnly,
        radius: InstaCircleAvatarSize.small,
      ),
    );
  }
}
