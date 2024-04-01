import 'package:cj_flutter_riverpod_instagram_clone/view/edit_post/mobile/edit_post_mobile_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_post/provider/edit_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPostPage extends ConsumerWidget {
  final String? id;
  const EditPostPage({super.key, this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
        overrides: [previewEditMediaIdProvider.overrideWithValue(id!)],
        child: const EditPostMobilePage());
  }
}
