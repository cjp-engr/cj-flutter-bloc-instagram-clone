import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserBioWidget extends StatelessWidget {
  final ImageDetails details;
  const UserBioWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.goNamed(
              InstaRouteNames.userDetails,
              pathParameters: {'id': details.userId!},
            );
          },
          child: Row(
            children: [
              const InstaCircleAvatar(
                image: IconRes.testOnly,
                radius: InstaCircleAvatarSize.small,
              ),
              const SizedBox(width: InstaSpacing.extraSmall),
              Column(
                children: [
                  InstaText(text: details.userName!),
                  InstaText(
                    text: details.location ?? '',
                    color: applyColor[InstaColor.disabled],
                  ),
                ],
              ),
            ],
          ),
        ),
        const _DisplayOptionsWidget(),
      ],
    );
  }
}

class _DisplayOptionsWidget extends StatelessWidget {
  const _DisplayOptionsWidget();

  @override
  Widget build(BuildContext context) {
    return const SecondaryButton(
      assetName: IconRes.menuVertical,
      scale: 3.5,
    );
  }
}
