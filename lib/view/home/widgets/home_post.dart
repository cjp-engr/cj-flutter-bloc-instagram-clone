import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class HomePost extends StatelessWidget {
  const HomePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _userDetails(),
        const SizedBox(height: InstaSpacing.extraSmall),
        _content(),
        const SizedBox(height: InstaSpacing.extraSmall),
        _icons(),
      ],
    );
  }

  Widget _userDetails() {
    return const Row(
      children: [
        InstaCircleAvatar(
          image: IconRes.testOnly,
          radius: InstaCircleAvatarSize.small,
        ),
        SizedBox(width: InstaSpacing.extraSmall),
        InstaText(
          text: 'user_name',
        ),
      ],
    );
  }

  Widget _content() {
    return Image.network(
      IconRes.testOnly,
      width: double.infinity,
      height: 320,
      fit: BoxFit.fill,
    );
  }

  Widget _icons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InstaButton(
              buttonType: InstaButtonType.icon,
              assetName: IconRes.heart,
            ),
            SizedBox(width: InstaSpacing.verySmall),
            InstaButton(
              buttonType: InstaButtonType.icon,
              assetName: IconRes.comment,
            ),
            SizedBox(width: InstaSpacing.verySmall),
            InstaButton(
              buttonType: InstaButtonType.icon,
              assetName: IconRes.paperPlane,
            ),
          ],
        ),
        InstaButton(
          buttonType: InstaButtonType.icon,
          assetName: IconRes.saved,
        ),
      ],
    );
  }
}
