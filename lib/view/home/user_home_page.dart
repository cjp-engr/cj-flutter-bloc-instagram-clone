import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/display_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'package:go_router/go_router.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: Breakpoints.mediumAndUp.isActive(context)
          ? const SizedBox()
          : Row(
              children: [
                SecondaryButton(
                  assetName: IconRes.back,
                  scale: 4,
                  onPressed: () => context.goNamed(InstaRouteNames.profile),
                ),
              ],
            ),
      body: TapRegion(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DisplayMediaWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
