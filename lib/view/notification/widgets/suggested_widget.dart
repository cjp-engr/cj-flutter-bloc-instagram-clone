import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuggestedWidget extends StatefulWidget {
  const SuggestedWidget({super.key});

  @override
  State<SuggestedWidget> createState() => _SuggestedWidgetState();
}

class _SuggestedWidgetState extends State<SuggestedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InstaText(text: AppLocalizations.of(context)!.suggestedForYou),
        const SizedBox(height: InstaSpacing.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetails(),
            _buildActions(),
          ],
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return Row(
      children: [
        const InstaCircleAvatar(
          image: IconRes.testOnly,
          radius: InstaCircleAvatarSize.medium,
        ),
        const SizedBox(width: InstaSpacing.verySmall),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InstaText(text: 'user_name'),
            InstaText(text: AppLocalizations.of(context)!.suggestedForYou)
          ],
        )
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        PrimaryButton(
          text: AppLocalizations.of(context)!.follow,
          color: InstaColor.secondary,
          onPressed: () {},
        ),
        const SecondaryButton(
          assetName: IconRes.menuVertical,
        ),
      ],
    );
  }
}
