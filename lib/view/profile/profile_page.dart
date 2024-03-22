import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/alert_dialog.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/details_widgets/counts_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/details_widgets/highlights_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/details_widgets/name_description_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/details_widgets/username_buttons_widget.dart';

import 'package:cj_flutter_riverpod_instagram_clone/view/profile/widgets/content_widgets/contents_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final String? id;
  const ProfilePage({super.key, this.id});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () => ref.read(displayImagesProvider.notifier).getImages());
  }

  @override
  Widget build(BuildContext context) {
    _displayImagesListener();
    return InstaAppBar(
      appBarTitle: Breakpoints.mediumAndUp.isActive(context)
          ? const SizedBox()
          : const InstaText(
              text: 'Instaclone',
              fontSize: InstaFontSize.veryLarge,
              fontWeight: FontWeight.bold,
            ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Breakpoints.mediumAndUp.isActive(context) ? 80 : 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: InstaSpacing.verySmall),
            UserNameAndButtonsWidget(id: widget.id),
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

  void _displayImagesListener() {
    ref.listen<AsyncValue<void>>(
      displayImagesProvider,
      (prev, next) {
        next.whenOrNull(
          error: (e, st) {
            showAlertDialog(
              context,
              title: e.toString(),
              buttonCancelText: 'OK',
            );
          },
        );
      },
    );
  }
}
