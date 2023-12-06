import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUserDetails(context),
        const SizedBox(height: InstaSpacing.extraSmall),
        _buildContent(),
        const SizedBox(height: InstaSpacing.extraSmall),
        _buildIcons(),
      ],
    );
  }

  Widget _buildUserDetails(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          InstaRouteNames.userDetails,
          pathParameters: {'id': '1'},
        );
      },
      child: const Row(
        children: [
          InstaCircleAvatar(
            image: IconRes.testOnly,
            radius: InstaCircleAvatarSize.small,
          ),
          SizedBox(width: InstaSpacing.extraSmall),
          Column(
            children: [
              InstaText(text: 'user_name'),
              InstaText(
                text: 'Afghanistan',
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Image.network(
      IconRes.testOnly,
      width: double.infinity,
      height: 320,
      fit: BoxFit.fill,
    );
  }

  Widget _buildIcons() {
    return const Row(
      children: [
        InstaButton(
          buttonType: InstaButtonType.icon,
          assetName: IconRes.heart,
        ),
        SizedBox(width: InstaSpacing.small),
        InstaButton(
          buttonType: InstaButtonType.icon,
          assetName: IconRes.saved,
        ),
      ],
    );
  }
}
