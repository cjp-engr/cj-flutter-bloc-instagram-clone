import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:flutter/material.dart';

class InstaTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final int maxLines;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Function(String)? onSubmitted;
  const InstaTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.prefixIcon,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      maxLines: maxLines,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(color: applyColor[InstaColor.disabled]),
        contentPadding: const EdgeInsets.symmetric(
          vertical: InstaSpacing.verySmall,
          horizontal: InstaSpacing.verySmall,
        ),
        prefixIcon: prefixIcon,
        labelText: label,
        labelStyle: TextStyle(fontSize: InstaFontSize.medium.value),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(InstaBorderRadius.small),
          ),
          borderSide: BorderSide(
            color: applyColor[InstaColor.tertiary]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(InstaBorderRadius.small),
          ),
          borderSide: BorderSide(color: applyColor[InstaColor.disabled]!),
        ),
      ),
    );
  }
}
