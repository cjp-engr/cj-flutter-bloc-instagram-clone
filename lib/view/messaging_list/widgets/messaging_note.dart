import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class MessagingNote extends StatelessWidget {
  const MessagingNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: InstaSpacing.small),
              child: InstaCircleAvatar(image: IconRes.testOnly),
            ),
            Positioned(
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                height: 30,
                width: 50,
                child: const Center(
                  child: InstaText(
                    text: 'Note...',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: InstaSpacing.tiny,
        ),
        const InstaText(
          text: 'Your Note',
          color: Colors.grey,
        ),
      ],
    );
  }
}
