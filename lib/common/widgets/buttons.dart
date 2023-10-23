import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';

class InstaButton extends StatelessWidget {
  final InstaButtonType buttonType;
  final String? text;
  final String? assetName;
  final Function()? onPressed;
  const InstaButton({
    super.key,
    required this.buttonType,
    this.text,
    this.assetName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case InstaButtonType.primary:
        return _PrimaryButton(text: text!, onPressed: onPressed);
      case InstaButtonType.icon:
        return _IconButton(
          assetName: assetName!,
          onPressed: onPressed,
        );

      default:
        return const Placeholder();
    }
  }
}

class _IconButton extends StatelessWidget {
  final String assetName;
  final Function()? onPressed;
  const _IconButton({
    Key? key,
    required this.assetName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
        splashFactory: NoSplash.splashFactory,
      ).copyWith(overlayColor: MaterialStateProperty.all(Colors.transparent)),
      child: Image.asset(
        assetName,
        scale: 2.3,
        color: Colors.white,
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const _PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade800,
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(vertical: 10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: InstaText(
          text: text,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
