import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_content_widgets/profile_content_all.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_content_widgets/profile_content_tagged.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_content_widgets/profile_content_video.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  int _selectedTabBar = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            tabs: _tabs,
            onTap: (index) => setState(
              () {
                _selectedTabBar = index;
              },
            ),
            indicator: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
            ),
            splashFactory: NoSplash.splashFactory,
          ),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Builder(
      builder: (_) {
        if (_selectedTabBar == 0) {
          return const ProfileContentAll();
        } else if (_selectedTabBar == 1) {
          return const ProfileContentVideo();
        } else if (_selectedTabBar == 2) {
          return const Text("Saved Body");
        } else {
          return const ProfileContentTagged();
        }
      },
    );
  }

  Widget _tab(String assetName) {
    return Tab(
      icon: InstaButton(
        buttonType: InstaButtonType.icon,
        assetName: assetName,
      ),
    );
  }

  List<Widget> get _tabs => [
        _tab(IconRes.grid),
        _tab(IconRes.video),
        _tab(IconRes.saved),
        _tab(IconRes.userTagged),
      ];
}
