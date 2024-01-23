import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/controller/add_post_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoAddedMediaWidget extends ConsumerStatefulWidget {
  const NoAddedMediaWidget({
    super.key,
  });

  @override
  ConsumerState<NoAddedMediaWidget> createState() => _NoAddedMediaWidgetState();
}

class _NoAddedMediaWidgetState extends ConsumerState<NoAddedMediaWidget> {
  late AddPostController _controller;
  late DropzoneViewController _dropZoneController;

  @override
  void initState() {
    super.initState();
    _controller = AddPostController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          _buildDropZoneArea(),
          _buildDropZoneComponents(),
        ],
      ),
    );
  }

  Widget _buildDropZoneArea() => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: InstaSpacing.small,
          horizontal: InstaSpacing.extraLarge,
        ),
        child: DottedBorder(
          radius: const Radius.circular(InstaBorderRadius.small),
          color: applyColor[InstaColor.tertiary]!,
          borderType: BorderType.RRect,
          strokeWidth: 2,
          dashPattern: const [
            10,
            10,
          ],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(InstaBorderRadius.small * 2),
            ),
            child: DropzoneView(
              operation: DragOperation.move,
              mime: const ['image/jpeg', 'image/png'],
              onCreated: (ctrl) => _dropZoneController = ctrl,
              onDropMultiple: (event) async {
                for (var i in event!) {
                  _controller.droppedImages(i, _dropZoneController);
                }
              },
            ),
          ),
        ),
      );

  Widget _buildDropZoneComponents() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: InstaSpacing.veryLarge),
          const InstaText(
            text: 'Create new post',
            fontSize: InstaFontSize.large,
          ),
          const SizedBox(height: InstaSpacing.large),
          Image.asset(
            IconRes.camera,
            color: applyColor[InstaColor.tertiary],
          ),
          const InstaText(
            text: 'Drag photos and videos here',
            fontSize: InstaFontSize.veryLarge,
          ),
          const SizedBox(height: InstaSpacing.large),
          PrimaryButton(
            color: InstaColor.secondary,
            width: 220,
            height: 40,
            text: 'Select from Computer',
            onPressed: () async {
              _controller.pickImages();
            },
          ),
        ],
      ),
    );
  }
}
