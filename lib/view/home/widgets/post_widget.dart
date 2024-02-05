import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostedMediaWidget extends StatelessWidget {
  const PostedMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _UserDetailsWidget(),
        SizedBox(height: InstaSpacing.extraSmall),
        _ContentMediaWidget(),
        SizedBox(height: InstaSpacing.extraSmall),
        _IconsWidget(),
      ],
    );
  }
}

class _UserDetailsWidget extends StatelessWidget {
  const _UserDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          InstaRouteNames.userDetails,
          pathParameters: {'id': '1'},
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
              const InstaText(text: 'user_name'),
              InstaText(
                text: 'Afghanistan',
                color: applyColor[InstaColor.disabled],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContentMediaWidget extends StatelessWidget {
  const _ContentMediaWidget();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      IconRes.testOnly,
      width: double.infinity,
      height: 320,
      fit: BoxFit.fill,
    );
  }
}

class _IconsWidget extends StatelessWidget {
  const _IconsWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SecondaryButton(
          assetName: IconRes.heart,
        ),
        SizedBox(width: InstaSpacing.small),
        SecondaryButton(
          assetName: IconRes.saved,
        ),
      ],
    );
  }
}
