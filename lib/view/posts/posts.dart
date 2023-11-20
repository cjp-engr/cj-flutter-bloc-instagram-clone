import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: const InstaText(
        text: 'New Post',
      ),
      body: const InstaText(text: 'New Post body!!!'),
    );
  }
}
