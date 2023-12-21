// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/dialog_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class InstaDialog extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function()? onPressed;
  final InstaDialogType dialogType;
  const InstaDialog({
    super.key,
    this.title,
    this.subTitle,
    this.onPressed,
    required this.dialogType,
  });

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case InstaDialogType.primary:
        return _PrimaryDialog(
          title: title ?? '',
          subTitle: subTitle ?? '',
          onPressed: onPressed!,
        );

      default:
        return _PrimaryDialog(
          title: title ?? '',
          subTitle: subTitle ?? '',
          onPressed: onPressed!,
        );
    }
  }
}

class _PrimaryDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() onPressed;
  const _PrimaryDialog({
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(InstaBorderRadius.small),
        ),
      ),
      title: InstaText(text: title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            InstaText(text: subTitle),
          ],
        ),
      ),
      actions: <Widget>[
        InstaButton(
          buttonType: InstaButtonType.primary,
          text: 'No',
          onPressed: () => Navigator.of(context).pop(),
        ),
        InstaButton(
          buttonType: InstaButtonType.secondary,
          text: 'Yes',
          onPressed: onPressed,
        ),
      ],
    );
  }
}

Future<void> showAlertDialog(
  BuildContext context, {
  String? title,
  String? subTitle,
  Function()? onPressed,
  required InstaDialogType dialogType,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return InstaDialog(
        title: title,
        subTitle: subTitle,
        onPressed: onPressed,
        dialogType: dialogType,
      );
    },
  );
}
