import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_first_col_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_second_col_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarLeading: InstaButton(
        buttonType: EButtonType.icon,
        assetName: IconRes.settings,
        onPressed: () {},
      ),
      appBarActions: const [
        InstaButton(
          buttonType: EButtonType.icon,
          assetName: IconRes.discoverPeople,
        )
      ],
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfileFirstColWidget(),
            SizedBox(height: 20),
            ProfileSecondColWidget(),
          ],
        ),
      ),
    );
  }
}
