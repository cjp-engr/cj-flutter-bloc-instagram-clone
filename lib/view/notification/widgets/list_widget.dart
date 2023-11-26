import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InstaText(text: 'New'),
        const SizedBox(height: InstaSpacing.verySmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLeftDetails(),
            _buildRightDetails(),
          ],
        ),
      ],
    );
  }

  Widget _buildLeftDetails() {
    return const Row(
      children: [
        InstaCircleAvatar(
          image: IconRes.testOnly,
          radius: InstaCircleAvatarSize.medium,
        ),
        SizedBox(width: InstaSpacing.verySmall),
        SizedBox(
          width: 240,
          child: InstaText(
            text: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum',
            maxLines: 2,
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }

  Widget _buildRightDetails() {
    return SizedBox(
      child: Image.network(
        IconRes.testOnly,
        height: InstaCircleAvatarSize.medium * 2,
        width: InstaCircleAvatarSize.medium * 2,
      ),
    );
  }
}
