import 'package:flutter/material.dart';

class InstaText extends StatelessWidget {
  final String text;
  const InstaText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
