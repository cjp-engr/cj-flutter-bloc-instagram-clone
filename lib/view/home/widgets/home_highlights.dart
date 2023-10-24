import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeHighlights extends StatelessWidget {
  const HomeHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InstaCircleAvatar(image: IconRes.testOnly),
        SizedBox(height: InstaSpacing.tiny),
        InstaText(text: 'Your story')
      ],
    );
  }
}
