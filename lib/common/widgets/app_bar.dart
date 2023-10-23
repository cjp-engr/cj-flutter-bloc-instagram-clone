import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InstaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? appBarLeading;
  final Widget? appBarTitle;
  List<Widget>? appBarActions;
  final Widget? body;
  InstaAppBar({
    super.key,
    this.appBarLeading,
    this.appBarTitle,
    this.appBarActions,
    this.body,
  });

  @override
  Widget build(Object context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: appBarLeading,
          title: appBarTitle,
          actions: appBarActions,
        ),
        body: SingleChildScrollView(child: body),
        bottomNavigationBar: const InstaBottomNavBar(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
