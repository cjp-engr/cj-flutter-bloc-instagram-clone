import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

// * Button with Text only
class PrimaryButton extends StatelessWidget {
  final String text;
  final InstaColor color;
  final Function()? onPressed;
  final double? width;
  final double? height;

  const PrimaryButton({
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
          backgroundColor: onPressed == null
              ? buttonColor[InstaColor.disabled]
              : buttonColor[color],
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

// * Button with Icon only
class SecondaryButton extends StatelessWidget {
  final String assetName;
  final double? scale;
  final Color? color;
  final Function()? onPressed;
  const SecondaryButton({
    super.key,
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

// * Button with Text and Icon
class TertiaryButton extends StatelessWidget {
  final String text;
  final String assetName;
  final Function()? onPressed;
  final double? width;
  final double? height;
  const TertiaryButton({
    super.key,
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
