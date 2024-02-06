import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/add_post_mobile_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/web/add_post_web_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isIos = defaultTargetPlatform == TargetPlatform.iOS;

    return kIsWeb && (!isAndroid || !isIos)
        ? const AddPostWebPage()
        : const AddPostMobilePage();
  }
}
