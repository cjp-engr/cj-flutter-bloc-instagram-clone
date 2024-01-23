import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/controller/add_post_controller.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemovePostWidget extends ConsumerStatefulWidget {
  const RemovePostWidget({super.key});

  @override
  ConsumerState<RemovePostWidget> createState() => _RemovePostWidgetState();
}

class _RemovePostWidgetState extends ConsumerState<RemovePostWidget> {
  late AddPostController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddPostController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      assetName: IconRes.delete,
      color: Colors.red,
      scale: 2,
      onPressed: () {
        _controller
            .removeMedia(ref.watch(addPostNotifierProvider).previewImageIndex);
      },
    );
  }
}
