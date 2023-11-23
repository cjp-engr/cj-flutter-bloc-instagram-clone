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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: InstaSpacing.verySmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: InstaSpacing.verySmall),
            UserNameAndButtonsWidget(id: id),
            const SizedBox(height: InstaSpacing.veryLarge),
            const NameAndDescriptionWidget(),
            const SizedBox(height: InstaSpacing.verySmall),
            const HighlightsWidget(),
            const SizedBox(height: InstaSpacing.verySmall),
            const CountsWidget(),
            const SizedBox(height: InstaSpacing.verySmall),
            const ContentsWidget(),
          ],
        ),
      ),
    );
  }
}
