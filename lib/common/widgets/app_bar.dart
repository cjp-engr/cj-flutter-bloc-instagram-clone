import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';

// ignore: must_be_immutable
class InstaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? appBarLeading;
  final Widget? appBarTitle;
  final Widget? floatingActionButton;

  final Widget? body;
  List<Widget>? appBarActions;
  InstaAppBar({
    super.key,
    this.appBarLeading,
    this.appBarTitle,
    this.floatingActionButton,
    this.body,
    this.appBarActions,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        appBar: AppBar(
          leading: appBarLeading,
          title: appBarTitle,
          actions: [...appBarActions ?? [], SizedBox(width: context.padding)],
        ),
        body: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('smallBody'),
                builder: (_) => SingleChildScrollView(child: body!),
              ),
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('mediumAndUpBody'),
                builder: (_) => SingleChildScrollView(child: body!),
              ),
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
