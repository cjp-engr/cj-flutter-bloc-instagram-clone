import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class ProfileCountsWidget extends StatelessWidget {
  const ProfileCountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: InstaSpacing.tiny),
            Column(
              children: [
                InstaText(
                  text: '25',
                  fontWeight: FontWeight.bold,
                ),
                InstaText(
                  text: 'posts',
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(width: InstaSpacing.tiny),
            Column(
              children: [
                InstaText(
                  text: '4',
                  fontWeight: FontWeight.bold,
                ),
                InstaText(
                  text: 'followers',
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(width: InstaSpacing.tiny),
            Column(
              children: [
                InstaText(
                  text: '54',
                  fontWeight: FontWeight.bold,
                ),
                InstaText(
                  text: 'following',
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(width: InstaSpacing.tiny),
          ],
        ),
        Divider(),
      ],
    );
  }
}
