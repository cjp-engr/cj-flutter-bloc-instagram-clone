import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:flutter/material.dart';

class IconsWidget extends StatelessWidget {
  const IconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SecondaryButton(
          assetName: IconRes.heart,
          scale: 3,
        ),
        SizedBox(width: InstaSpacing.tiny),
        SecondaryButton(
          assetName: IconRes.saved,
          scale: 3,
        ),
      ],
    );
  }
}
