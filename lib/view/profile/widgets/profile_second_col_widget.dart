import 'package:flutter/material.dart';

class ProfileSecondColWidget extends StatelessWidget {
  const ProfileSecondColWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name Last Name'),
            Text('Description Lorem Ipsum'),
          ],
        ),
        SizedBox(),
      ],
    );
  }
}
