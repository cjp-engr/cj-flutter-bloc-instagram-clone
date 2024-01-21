import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';

const Map<InstaColor, Color> buttonColor = {
  InstaColor.primary: Color.fromRGBO(66, 66, 66, 1),
  InstaColor.secondary: Color.fromRGBO(33, 150, 243, 1),
  // InstaButtonColor.tertiary: "Element 3",
  // InstaButtonColor.icon: "Element 4",
};

class InstaButton extends StatelessWidget {
  final InstaButtonType buttonType;
  final String? text;
  final String? assetName;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final double? iconScale;
  final Color? color;
  const InstaButton({
    super.key,
    required this.buttonType,
    this.text,
    this.assetName,
    this.onPressed,
    this.width,
    this.height,
    this.iconScale,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case InstaButtonType.tertiary:
        return _TertiaryButton(
          text: text ?? 'Home',
          assetName: assetName ?? IconRes.home,
          onPressed: onPressed,
          width: width,
          height: height,
        );
      case InstaButtonType.icon:
        return _IconButton(
          assetName: assetName ?? IconRes.home,
          onPressed: onPressed,
          scale: iconScale,
          color: color,
        );

      default:
        return const Placeholder();
    }
  }
}

class _IconButton extends StatelessWidget {
  final String assetName;
  final double? scale;
  final Color? color;
  final Function()? onPressed;
  const _IconButton({
    required this.assetName,
    this.scale,
    this.color,
    this.onPressed,
  });

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
        scale: scale ?? 2.7,
        color: color ?? Colors.white,
      ),
    );
  }
}

class TextOnlyButton extends StatelessWidget {
  final String text;
  final InstaColor color;
  final Function()? onPressed;
  final double? width;
  final double? height;

  const TextOnlyButton({
    super.key,
    required this.text,
    required this.color,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 120,
      height: height ?? context.screenHeight * 0.055,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor[color],
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

class _TertiaryButton extends StatelessWidget {
  final String text;
  final String assetName;
  final Function()? onPressed;
  final double? width;
  final double? height;
  const _TertiaryButton({
    required this.text,
    required this.assetName,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 120,
      height: height ?? context.screenHeight * 0.055,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetName,
              scale: 2.7,
              color: Colors.white,
            ),
            const SizedBox(width: InstaSpacing.verySmall),
            InstaText(
              text: text,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
