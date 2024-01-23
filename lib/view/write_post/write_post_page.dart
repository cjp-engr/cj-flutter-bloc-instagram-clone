import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WritePostPage extends StatelessWidget {
  const WritePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      body: const Text('Write Post Page'),
      appBarLeading: const BackButton(),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
        assetName: IconRes.back,
        onPressed: () {
          context.goNamed(InstaRouteNames.addPost);
        });
  }
}
