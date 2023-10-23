import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
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
            InstaText(
              text: 'First Name Last Name',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: InstaSpacing.medium),
            InstaText(text: 'Description Lorem Ipsum'),
            SizedBox(height: InstaSpacing.small),
          ],
        ),
        SizedBox(),
      ],
    );
  }
}
