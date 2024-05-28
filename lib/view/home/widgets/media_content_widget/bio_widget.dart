import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BioWidget extends ConsumerWidget {
  const BioWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(homeProvider).imageDetails;
    return InkWell(
      onTap: () {
        context.goNamed(
          InstaRouteNames.userDetails,
          pathParameters: {'id': details.userId!},
        );
      },
      child: Row(
        children: [
          InstaCircleAvatar(
            image: details?.userImage ?? IconRes.testOnly,
            radius: InstaCircleAvatarSize.small,
          ),
          const SizedBox(width: InstaSpacing.extraSmall),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InstaText(text: details!.userName!),
              InstaText(
                text: details.location ?? '',
                color: applyColor[InstaColor.disabled],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
