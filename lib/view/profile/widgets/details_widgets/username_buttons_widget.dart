import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserNameAndButtonsWidget extends StatefulWidget {
  final String? id;
  const UserNameAndButtonsWidget({super.key, this.id});

  @override
  State<UserNameAndButtonsWidget> createState() =>
      _UserNameAndButtonsWidgetState();
}

class _UserNameAndButtonsWidgetState extends State<UserNameAndButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InstaCircleAvatar(
          image: IconRes.testOnly,
          radius: 50,
        ),
        const SizedBox(width: InstaSpacing.large),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserNameAndButton(widget.id != null),
            const SizedBox(height: InstaSpacing.large),
            _buildButtons(widget.id != null),
          ],
        )
      ],
    );
  }

  Widget _buildUserNameAndButton(bool hasId) {
    return Row(
      children: [
        const InstaText(
          text: 'user_name',
          fontWeight: FontWeight.bold,
          fontSize: InstaFontSize.veryLarge,
        ),
        const SizedBox(width: InstaSpacing.verySmall),
        hasId
            ? const InstaButton(
                buttonType: InstaButtonType.icon,
                assetName: IconRes.ellipsis,
              )
            : InstaButton(
                buttonType: InstaButtonType.icon,
                assetName: IconRes.settings,
                onPressed: () => context.goNamed(InstaRouteNames.settings),
              )
      ],
    );
  }

  Widget _buildButtons(bool hasId) {
    return Row(
      children: [
        InstaButton(
          buttonType: InstaButtonType.primary,
          text: hasId
              ? AppLocalizations.of(context)!.following
              : AppLocalizations.of(context)!.editProfile,
          onPressed: () {},
        ),
        const SizedBox(width: InstaSpacing.extraSmall),
        InstaButton(
          buttonType: InstaButtonType.primary,
          text: hasId
              ? AppLocalizations.of(context)!.message
              : AppLocalizations.of(context)!.viewArchive,
          onPressed: () {},
        ),
      ],
    );
  }
}
