import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/widgets/select_dialog_widget.dart';
import 'package:flutter/material.dart';

class AddPostButtonWidget extends StatelessWidget {
  const AddPostButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: InstaSpacing.verySmall),
        Row(
          children: [
            SizedBox(width: InstaSpacing.large),
            _MediaButtonWidget(),
            SizedBox(width: InstaSpacing.large),
          ],
        ),
        SizedBox(height: InstaSpacing.small),
      ],
    );
  }
}

class _MediaButtonWidget extends StatelessWidget {
  const _MediaButtonWidget();

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      assetName: IconRes.gallery,
      scale: 2,
      onPressed: () {
        showSelectDialog(context, title: 'Select to upload');
      },
    );
  }
}
