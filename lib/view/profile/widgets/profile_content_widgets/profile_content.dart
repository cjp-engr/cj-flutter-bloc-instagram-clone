import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_content_widgets/profile_content_all.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_content_widgets/profile_content_tagged.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_content_widgets/profile_content_video.dart';
import 'package:flutter/material.dart';

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            tabs: [
              _tab(IconRes.grid),
              _tab(IconRes.video),
              _tab(IconRes.saved),
              _tab(IconRes.userTagged),
            ],
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
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const TabBarView(
              children: [
                ProfileContentAllWidget(),
                ProfileContentVideoWidget(),
                Text("Saved Body"),
                ProfileContentTaggedWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(String assetName) {
    return Tab(
      icon: InstaButton(
        buttonType: EButtonType.icon,
        assetName: assetName,
      ),
    );
  }
}
