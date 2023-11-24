import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get padding => screenWidth > 400 && screenWidth < 640
      ? InstaSpacing.small
      : screenWidth * 0.12;
  double get title =>
      screenWidth > 400 && screenWidth < 640 ? 0 : screenWidth * 0.10;
}
