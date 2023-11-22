import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';

import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/a_profile_first_col.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/b_profile_second_col.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_content_widgets/profile_content.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_counts.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/profile_highlights.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String? id;
  const ProfilePage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: const InstaText(
        text: 'Instaclone',
        fontSize: InstaFontSize.veryLarge,
        fontWeight: FontWeight.bold,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: InstaSpacing.verySmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: InstaSpacing.verySmall),
            ProfileFirstCol(),
            SizedBox(height: InstaSpacing.veryLarge),
            ProfileSecondCol(),
            SizedBox(height: InstaSpacing.verySmall),
            ProfileHighlights(),
            SizedBox(height: InstaSpacing.verySmall),
            ProfileCounts(),
            SizedBox(height: InstaSpacing.verySmall),
            ProfileContent(),
          ],
        ),
      ),
    );
  }
}
