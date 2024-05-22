import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
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
      backgroundImage: NetworkImage(image),
      radius: radius,
    );
  }
}
