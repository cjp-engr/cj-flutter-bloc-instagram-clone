import 'package:flutter/material.dart';

class InstaCircleAvatar extends StatelessWidget {
  final String image;
  final double? radius;
  const InstaCircleAvatar({
    super.key,
    required this.image,
    this.radius = 40,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: (radius! + 4.0),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: (radius! + 2.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: radius,
        ),
      ),
    );
  }
}
