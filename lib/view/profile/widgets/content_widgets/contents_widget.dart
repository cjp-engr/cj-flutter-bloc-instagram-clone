import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/content_widgets/content_image_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/content_widgets/content_saved_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/content_widgets/content_tagged_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/content_widgets/content_video_widget.dart';
import 'package:flutter/material.dart';

class ContentsWidget extends StatefulWidget {
  const ContentsWidget({super.key});

  @override
  State<ContentsWidget> createState() => _ContentsWidgetState();
}

class _ContentsWidgetState extends State<ContentsWidget> {
  int _selectedTabBar = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTabBar(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: _tabs,
      onTap: (index) => setState(
        () {
          _selectedTabBar = index;
        },
      ),
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: applyColor[InstaColor.tertiary]!,
            width: 3.0,
          ),
        ),
      ),
      splashFactory: NoSplash.splashFactory,
    );
  }

  Widget _buildContent() {
    return Builder(
      builder: (_) {
        if (_selectedTabBar == 0) {
          return const ContentImageWidget();
        } else if (_selectedTabBar == 1) {
          return const ContentVideoWidget();
        } else if (_selectedTabBar == 2) {
          return const ContentSavedWidget();
        } else {
          return const ContentTaggedWidget();
        }
      },
    );
  }

  Widget _tab(String assetName) {
    return Tab(
      icon: SecondaryButton(
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
