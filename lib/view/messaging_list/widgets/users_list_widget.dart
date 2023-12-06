import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsersListWidget extends StatefulWidget {
  const UsersListWidget({super.key});

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSubHeaders(),
        const SizedBox(height: InstaSpacing.medium),
        _buildDisplayDetails(context),
      ],
    );
  }

  Widget _buildSubHeaders() {
    return Row(
      children: [
        InstaText(text: AppLocalizations.of(context)!.messages),
      ],
    );
  }

  Widget _buildDisplayDetails(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.goNamed(
              InstaRouteNames.messagingChat,
              pathParameters: {'id': '1'},
            );
          },
          child: Row(
            children: [
              _userDetails(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _userDetails() {
    return Row(
      children: [
        const InstaCircleAvatar(image: IconRes.testOnly),
        const SizedBox(width: InstaSpacing.small),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InstaText(
              text: 'user_name',
            ),
            InstaText(
              text: AppLocalizations.of(context)!.activeTimeAgo('5h'),
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
