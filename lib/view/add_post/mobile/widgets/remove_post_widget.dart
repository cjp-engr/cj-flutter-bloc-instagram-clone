import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/controller/add_post_controller.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemovePostWidget extends ConsumerWidget {
  const RemovePostWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = AddPostController(ref: ref);
    final state = ref.watch(addPostNotifierProvider);
    return state.mediaFileList?.isNotEmpty ?? false
        ? SecondaryButton(
            assetName: IconRes.delete,
            color: applyColor[InstaColor.alert],
            scale: 2,
            onPressed: () => controller.removeMedia(state.previewImageIndex),
          )
        : const SizedBox();
  }
}
