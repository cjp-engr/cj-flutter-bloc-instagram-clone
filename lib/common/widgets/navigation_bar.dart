// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
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
              key: const Key('smallNavigationShell'),
              builder: (_) => SizedBox(
                child: navigationShell,
              ),
            ),
            Breakpoints.medium: SlotLayout.from(
              key: const Key('mediumNavigationShell'),
              builder: (_) => SizedBox(
                child: navigationShell,
              ),
            ),
          },
        ),
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('smallBottomNavigation'),
              builder: (_) => _buildBottomNavigation(context),
            ),
          },
        ),
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.medium: SlotLayout.from(
              key: const Key('mediumNavigationRail'),
              builder: (_) => _buildNavigationRail(context),
            ),
          },
        ));
  }

  Widget _buildBottomNavigation(BuildContext context) {
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
      items: _bottomNavigationList(context),
      selectedFontSize: 0,
      unselectedFontSize: 0,
      iconSize: 0,
    );
  }

//https://stackoverflow.com/questions/71499560/renderflex-overflowing-in-navigationrail-and-navigationraildestination-on-window

  Widget _buildNavigationRail(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          NavigationRail(
            destinations: _sideNavigationList(context),
            selectedIndex: navigationShell!.currentIndex,
            onDestinationSelected: (int index) {
              navigationShell!.goBranch(
                index,
                initialLocation: index == navigationShell!.currentIndex,
              );
            },
            labelType: NavigationRailLabelType.all,
            useIndicator: false,
            leading: const SizedBox(height: InstaSpacing.veryLarge),
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: InstaSpacing.large),
                  child: _profileIcon(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<NavigationRailDestination> _sideNavigationList(BuildContext context) {
    return [
      NavigationRailDestination(
        icon: _homeIcon(),
        label: const InstaText(
            text: 'Home',
            fontSize: InstaFontSize.small,
            fontWeight: FontWeight.bold),
      ),
      NavigationRailDestination(
        icon: _notificationIcon(),
        label: const InstaText(
            text: 'Notification',
            fontSize: InstaFontSize.small,
            fontWeight: FontWeight.bold),
      ),
      NavigationRailDestination(
        icon: _newPostIcon(),
        label: const InstaText(
            text: 'Add Post',
            fontSize: InstaFontSize.small,
            fontWeight: FontWeight.bold),
      ),
      NavigationRailDestination(
        icon: _messageIcon(),
        label: const InstaText(
            text: 'Message',
            fontSize: InstaFontSize.small,
            fontWeight: FontWeight.bold),
      ),
      const NavigationRailDestination(
        icon: SizedBox(),
        label: InstaText(text: ''),
      ),
    ];
  }

  List<BottomNavigationBarItem> _bottomNavigationList(BuildContext context) {
    return [
      BottomNavigationBarItem(icon: _homeIcon(), label: ''),
      BottomNavigationBarItem(icon: _notificationIcon(), label: ''),
      BottomNavigationBarItem(icon: _newPostIcon(), label: ''),
      BottomNavigationBarItem(icon: _messageIcon(), label: ''),
      BottomNavigationBarItem(
        icon: _profileIcon(context),
        label: '',
      ),
    ];
  }

  Widget _profileIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(InstaRouteNames.profile);
      },
      child: const InstaCircleAvatar(
        image: IconRes.testOnly,
        radius: InstaCircleAvatarSize.small,
      ),
    );
  }

  Widget _homeIcon() => const InstaButton(
        assetName: IconRes.home,
        buttonType: InstaButtonType.icon,
      );

  Widget _notificationIcon() => const InstaButton(
        assetName: IconRes.notification,
        buttonType: InstaButtonType.icon,
      );

  Widget _newPostIcon() => const InstaButton(
        assetName: IconRes.newPost,
        buttonType: InstaButtonType.icon,
      );

  Widget _messageIcon() => const InstaButton(
        assetName: IconRes.messenger,
        buttonType: InstaButtonType.icon,
      );
}
