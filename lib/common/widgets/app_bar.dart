import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? body;
  const CustomAppBar({
    super.key,
    this.body,
  });

  @override
  Widget build(Object context) {
    return SafeArea(
      child: Scaffold(
        body: body,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
