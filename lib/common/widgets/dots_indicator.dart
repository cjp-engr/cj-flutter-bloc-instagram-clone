import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InstaDotsIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final double dotSize;
  const InstaDotsIndicator({
    super.key,
    required this.controller,
    this.count = 0,
    this.dotSize = InstaSpacing.extraSmall,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      onDotClicked: (index) {},
      count: count,
      effect: ScrollingDotsEffect(
        dotHeight: dotSize,
        dotWidth: dotSize,
        activeDotColor: applyColor[InstaColor.secondary]!,
        dotColor: applyColor[InstaColor.disabled]!,
      ),
    );
  }
}
