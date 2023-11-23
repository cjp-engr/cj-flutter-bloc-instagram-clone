import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class HighlightsWidget extends StatelessWidget {
  const HighlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildHighlight('Test Test'),
        const SizedBox(width: 10),
        _buildHighlight('New'),
      ],
    );
  }

  Widget _buildHighlight(String text) {
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
