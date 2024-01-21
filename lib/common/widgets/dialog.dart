// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:flutter/material.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';

class _InstaDialog extends StatelessWidget {
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
  Widget build(BuildContext context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(InstaBorderRadius.small),
            ),
          ),
          title: InstaText(text: title ?? ''),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                InstaText(text: subTitle ?? ''),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextOnlyButton(
              color: InstaColor.primary,
              text: buttonCancelText ?? '',
              onPressed: () => Navigator.of(context).pop(),
            ),
            onPressed == null
                ? const SizedBox()
                : TextOnlyButton(
                    color: InstaColor.secondary,
                    text: buttonConfirmText ?? 'Confirm',
                    onPressed: () {},
                  )
          ],
        ),
      );
}

Future<void> showAlertDialog(
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
