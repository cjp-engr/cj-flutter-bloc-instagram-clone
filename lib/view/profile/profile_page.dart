import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/details_widgets/counts_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/details_widgets/highlights_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/details_widgets/name_description_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/details_widgets/username_buttons_widget.dart';

import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/content_widgets/contents_widget.dart';
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
            UserNameAndButtonsWidget(),
            SizedBox(height: InstaSpacing.veryLarge),
            NameAndDescriptionWidget(),
            SizedBox(height: InstaSpacing.verySmall),
            HighlightsWidget(),
            SizedBox(height: InstaSpacing.verySmall),
            CountsWidget(),
            SizedBox(height: InstaSpacing.verySmall),
            ContentsWidget(),
          ],
        ),
      ),
    );
  }
}
