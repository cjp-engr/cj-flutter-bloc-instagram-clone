import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
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
            MediaButton(),
            SizedBox(width: InstaSpacing.large),
          ],
        ),
        SizedBox(height: InstaSpacing.small),
      ],
    );
  }
}

class MediaButton extends StatelessWidget {
  const MediaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InstaButton(
      buttonType: InstaButtonType.icon,
      assetName: IconRes.gallery,
      iconScale: 2,
      onPressed: () {
        showSelectDialog(context, title: 'Select to upload');
      },
    );
  }
}
