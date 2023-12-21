import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/controller/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPostButtonWidget extends ConsumerStatefulWidget {
  const AddPostButtonWidget({super.key});

  @override
  ConsumerState<AddPostButtonWidget> createState() =>
      _AddPostButtonWidgetState();
}

class _AddPostButtonWidgetState extends ConsumerState<AddPostButtonWidget> {
  late AddPostController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddPostController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: InstaSpacing.verySmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildCameraButton(),
                const SizedBox(width: InstaSpacing.large),
                _buildImageButton(),
                const SizedBox(width: InstaSpacing.large),
                _buildVideoButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildDeleteButton(),
              ],
            ),
          ],
        ),
        const SizedBox(height: InstaSpacing.small),
      ],
    );
  }

  Widget _buildCameraButton() {
    return const InstaButton(
      buttonType: InstaButtonType.icon,
      assetName: IconRes.camera,
      iconScale: 2,
    );
  }

  Widget _buildImageButton() {
    return InstaButton(
      buttonType: InstaButtonType.icon,
      assetName: IconRes.gallery,
      iconScale: 2,
      onPressed: () {
        _controller.pickImages();
      },
    );
  }

  Widget _buildVideoButton() {
    return InstaButton(
      buttonType: InstaButtonType.icon,
      assetName: IconRes.video,
      iconScale: 2,
      onPressed: () {
        _controller.pickVideo(ImageSource.gallery);
      },
    );
  }

  Widget _buildDeleteButton() {
    return InstaButton(
      buttonType: InstaButtonType.icon,
      assetName: IconRes.delete,
      iconScale: 2,
      onPressed: () {},
    );
  }
}
