import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/add_post_mobile_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/add_post_test.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/web/add_post_web_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const AddPostWebPage() : const AddPostMobilePage();
    // return const MyHomePage();
  }
}
