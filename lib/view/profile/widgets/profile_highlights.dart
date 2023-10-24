import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class ProfileHighlights extends StatelessWidget {
  const ProfileHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _highlights('Test Test'),
        const SizedBox(width: 10),
        _highlights('New'),
      ],
    );
  }

  Widget _highlights(String text) {
    return InkWell(
      onTap: () {},
      splashFactory: NoSplash.splashFactory,
      child: Column(
        children: [
          const InstaCircleAvatar(image: IconRes.testOnly),
          const SizedBox(height: InstaSpacing.tiny),
          InstaText(text: text)
        ],
      ),
    );
  }
}
