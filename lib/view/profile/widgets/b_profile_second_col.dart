import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
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
            SizedBox(height: InstaSpacing.large),
            Text('Description Lorem Ipsum'),
            SizedBox(height: InstaSpacing.large),
          ],
        ),
        SizedBox(),
      ],
    );
  }
}
