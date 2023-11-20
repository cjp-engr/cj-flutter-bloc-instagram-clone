import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

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
        body: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('body_small'),
                builder: (_) => SingleChildScrollView(child: body!),
              ),
              Breakpoints.medium: SlotLayout.from(
                key: const Key('body_medium'),
                builder: (_) => SingleChildScrollView(child: body!),
              )
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
