// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/routes_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/display_media_widget/home_details_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/display_media_widget/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';

class DisplayMediaWidget extends ConsumerWidget {
  const DisplayMediaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    if (router.routeInformationProvider.value.uri.toString() ==
        '/${InstaRouteNames.userHomePage}') {
      return const UserDetailsWidget();
    } else {
      return const HomeDetailsWidget();
    }
  }
}
