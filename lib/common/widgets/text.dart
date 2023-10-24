import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:flutter/material.dart';

class InstaText extends StatelessWidget {
  final String text;
  final InstaFontSize fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final int? maxLines;
  const InstaText({
    super.key,
    required this.text,
    this.fontSize = InstaFontSize.medium,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize.value,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
    );
  }
}
