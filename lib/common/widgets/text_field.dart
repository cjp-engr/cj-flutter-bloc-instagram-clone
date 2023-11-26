import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class InstaTextField extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  const InstaTextField({
    super.key,
    required this.label,
    this.prefixIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(
          vertical: InstaSpacing.verySmall,
          horizontal: InstaSpacing.verySmall,
        ),
        prefixIcon: prefixIcon,
        labelText: label,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(InstaBorderRadius.verySmall),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(InstaBorderRadius.verySmall),
          ),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
