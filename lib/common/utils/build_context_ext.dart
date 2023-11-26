import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

extension BuildContextExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get padding => Breakpoints.small.isActive(this)
      ? InstaSpacing.small
      : Breakpoints.medium.isActive(this)
          ? screenWidth * 0.12
          : screenWidth * 0.3;
}
