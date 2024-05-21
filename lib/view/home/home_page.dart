import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/display_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/display_media_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  final String? id;
  const HomePage({super.key, this.id});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(displayUserDetailsProvider.notifier).getUserDetails();
      ref.read(displayImagesProvider.notifier).getImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const DisplayMediaWidget();
  }
}
