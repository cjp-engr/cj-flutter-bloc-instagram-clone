// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/controller/add_post_controller.dart';
import 'package:flutter/material.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _InstaDialog extends ConsumerStatefulWidget {
  final String? title;
  final String? subTitle;
  final Function()? onPressed;
  final String? buttonConfirmText;
  final String? buttonCancelText;
  const _InstaDialog({
    required this.title,
    required this.subTitle,
    this.onPressed,
    this.buttonConfirmText,
    this.buttonCancelText,
  });

  @override
  ConsumerState<_InstaDialog> createState() => _InstaDialogState();
}

class _InstaDialogState extends ConsumerState<_InstaDialog> {
  late AddPostController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddPostController(ref: ref);
  }

  int selected = -1;
  @override
  Widget build(BuildContext context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(InstaBorderRadius.small),
            ),
          ),
          title: InstaText(text: widget.title ?? ''),
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _selectFile(
                  text: 'Image',
                  asset: IconRes.image,
                  index: 0,
                ),
                const SizedBox(width: InstaSpacing.large),
                _selectFile(
                  text: 'Video',
                  asset: IconRes.video,
                  index: 1,
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextOnlyButton(
              color: InstaColor.secondary,
              text: 'Confirm',
              onPressed: () {
                if (selected == 0) {
                  _controller.pickImages();
                } else {
                  _controller.pickVideo();
                }

                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );

  Widget _selectFile({
    required String text,
    required String asset,
    required int index,
  }) {
    final color = selected == index
        ? buttonColor[InstaColor.secondary]!
        : buttonColor[InstaColor.tertiary]!;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: InstaSpacing.veryLarge,
        vertical: InstaSpacing.small,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: const BorderRadius.all(
          Radius.circular(InstaBorderRadius.small),
        ),
      ),
      child: Column(
        children: [
          InstaButton(
            buttonType: InstaButtonType.icon,
            assetName: asset,
            iconScale: 1.5,
            color: color,
            onPressed: () {
              setState(() {
                selected = index;
              });
            },
          ),
          InstaText(
            text: text,
            color: color,
          ),
        ],
      ),
    );
  }
}

Future<void> showSelectDialog(
  BuildContext context, {
  String? title,
  String? subTitle,
  Function()? onPressed,
  final String? buttonConfirmText,
  final String? buttonCancelText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return _InstaDialog(
        title: title,
        subTitle: subTitle,
        onPressed: onPressed,
        buttonCancelText: buttonCancelText,
        buttonConfirmText: buttonConfirmText,
      );
    },
  );
}
