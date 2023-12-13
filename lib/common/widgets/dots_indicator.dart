import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InstaDotsIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final double dotHeight;
  const InstaDotsIndicator({
    super.key,
    required this.controller,
    required this.count,
    this.dotHeight = InstaSpacing.small,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      onDotClicked: (index) {},
      count: count,
      effect: ExpandingDotsEffect(dotHeight: dotHeight),
    );
  }
}
