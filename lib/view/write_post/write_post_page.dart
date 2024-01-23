import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/scroll_added_media.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WritePostPage extends StatelessWidget {
  const WritePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarActions: const [
        _PostButtonWidget(),
      ],
      body: Container(
        padding: const EdgeInsets.all(InstaSpacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScrollDisplayAddedMediaWidget(),
            const SizedBox(height: InstaSpacing.medium),
            InstaText(
              text: 'Write a description...',
              color: applyColor[InstaColor.disabled],
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: InstaSpacing.verySmall),
            const InstaTextField(
              label: '',
              maxLines: 4,
            ),
          ],
        ),
      ),
      appBarLeading: const _BackButtonWidget(),
    );
  }
}

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SecondaryButton(
          assetName: IconRes.back,
          scale: 3.5,
          onPressed: () {
            context.goNamed(InstaRouteNames.addPost);
          }),
    );
  }
}

class _PostButtonWidget extends StatelessWidget {
  const _PostButtonWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: InstaText(
        text: 'Post',
        color: applyColor[InstaColor.secondary],
      ),
    );
  }
}
