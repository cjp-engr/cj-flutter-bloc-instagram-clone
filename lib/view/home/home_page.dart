import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/highlight_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/like_comment_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: const InstaText(
        text: 'Instaclone',
        fontWeight: FontWeight.w900,
        fontSize: InstaFontSize.veryLarge,
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
              PostWidget(),
              SizedBox(height: InstaSpacing.medium),
              LikeAndCommentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
