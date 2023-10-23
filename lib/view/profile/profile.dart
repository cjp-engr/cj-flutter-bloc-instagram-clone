import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/a_profile_first_col.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/b_profile_second_col.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_content_widgets/profile_content.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_counts.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_highlights.dart';
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
        padding: EdgeInsets.symmetric(horizontal: InstaSpacing.verySmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: InstaSpacing.verySmall),
            ProfileFirstColWidget(),
            SizedBox(height: InstaSpacing.veryLarge),
            ProfileSecondColWidget(),
            SizedBox(height: InstaSpacing.verySmall),
            ProfileHighlightsWidget(),
            SizedBox(height: InstaSpacing.verySmall),
            ProfileCountsWidget(),
            SizedBox(height: InstaSpacing.verySmall),
            ProfileContentWidget(),
          ],
        ),
      ),
    );
  }
}
