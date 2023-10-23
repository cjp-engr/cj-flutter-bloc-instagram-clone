import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class ProfileFirstColWidget extends StatelessWidget {
  const ProfileFirstColWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(IconRes.testOnly),
          radius: 50,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                InstaText(
                  text: 'user_name',
                  fontWeight: FontWeight.bold,
                  fontSize: InstaFontSize.veryLarge,
                ),
                SizedBox(width: 10),
                InstaButton(
                  buttonType: InstaButtonType.icon,
                  assetName: IconRes.settings,
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                InstaButton(
                  buttonType: InstaButtonType.primary,
                  text: 'Edit Profile',
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                InstaButton(
                  buttonType: InstaButtonType.primary,
                  text: 'View Archive',
                  onPressed: () {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
