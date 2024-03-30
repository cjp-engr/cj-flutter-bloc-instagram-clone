// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_profile/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
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
  late EditProfileController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EditProfileController(ref: ref);
  }

  @override
  Widget build(BuildContext context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(InstaBorderRadius.small),
            ),
          ),
          title: InstaText(
            text: widget.title ?? '',
            fontWeight: FontWeight.bold,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Divider(),
                _selectFile(
                  text: 'Upload Photo',
                  asset: IconRes.upload,
                  index: 0,
                  color: applyColor[InstaColor.secondary]!,
                ),
                const Divider(),
                _selectFile(
                  text: 'Remove Current Photo',
                  asset: IconRes.remove,
                  index: 1,
                  color: applyColor[InstaColor.alert]!,
                ),
                const Divider(),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const InstaText(text: 'Cancel'),
            ),
          ],
        ),
      );

  Widget _selectFile({
    required String text,
    required String asset,
    required int index,
    required Color color,
  }) {
    return InkWell(
      onTap: index == 0
          ? () async {
              final navigator = Navigator.of(context);
              await _controller.pickImage();
              navigator.pop();
            }
          : _controller.removeImage,
      child: Padding(
        padding: const EdgeInsets.all(InstaSpacing.tiny),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                asset,
                color: color,
                scale: 4,
              ),
              const SizedBox(width: InstaSpacing.verySmall),
              InstaText(
                text: text,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showChangeProfileDialog(
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
