import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:flutter/material.dart';

class InstaCircleAvatar extends StatelessWidget {
  final String image;
  final double? radius;
  const InstaCircleAvatar({
    super.key,
    required this.image,
    this.radius = InstaCircleAvatarSize.large,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: applyColor[InstaColor.tertiary],
      radius: (radius! + 4.0),
      child: CircleAvatar(
        backgroundColor: applyColor[InstaColor.primary],
        radius: (radius! + 2.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: radius,
        ),
      ),
    );
  }
}
