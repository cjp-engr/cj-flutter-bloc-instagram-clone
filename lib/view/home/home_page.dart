import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/highlight_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/like_comment_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/posted_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: Breakpoints.mediumAndUp.isActive(context)
          ? const SizedBox()
          : const InstaText(
              text: 'Instaclone',
              fontSize: InstaFontSize.veryLarge,
              fontWeight: FontWeight.bold,
            ),
      body: TapRegion(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HighlightWidget(),
              SizedBox(height: InstaSpacing.medium),
              PostedMediaWidget(),
              SizedBox(height: InstaSpacing.medium),
              LikeAndCommentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
