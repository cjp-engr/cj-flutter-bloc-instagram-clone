import 'package:cj_flutter_riverpod_instagram_clone/common/constants/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/display_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserNameAndButtonsWidget extends ConsumerStatefulWidget {
  final String? id;
  const UserNameAndButtonsWidget({super.key, this.id});

  @override
  ConsumerState<UserNameAndButtonsWidget> createState() =>
      _UserNameAndButtonsWidgetState();
}

class _UserNameAndButtonsWidgetState
    extends ConsumerState<UserNameAndButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(displayUserDetailsProvider);

    return user.when(
      data: (data) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserImage(data?.imageUrl),
            const SizedBox(width: InstaSpacing.small),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserNameAndButton(data?.userName, widget.id != null),
                const SizedBox(height: InstaSpacing.large),
                _buildButtons(widget.id != null),
              ],
            )
          ],
        );
      },
      error: (error, stackTrace) {
        return const Text('there is an error');
      },
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildUserImage(String? image) {
    return InstaCircleAvatar(
      image: image ?? IconRes.testOnly,
      radius: 50,
    );
  }

  Widget _buildUserNameAndButton(String? userName, bool hasId) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        InstaText(
          text: userName ?? 'Username not displayed',
          fontWeight: FontWeight.bold,
          fontSize: InstaFontSize.veryLarge,
        ),
        hasId
            ? const SecondaryButton(
                assetName: IconRes.ellipsis,
                scale: 3.5,
              )
            : SecondaryButton(
                assetName: IconRes.settings,
                onPressed: () => context.goNamed(InstaRouteNames.settings),
                scale: 3,
              )
      ],
    );
  }

  Widget _buildButtons(bool hasId) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        PrimaryButton(
          color: InstaColor.primary,
          text: hasId
              ? AppLocalizations.of(context)!.following
              : AppLocalizations.of(context)!.editProfile,
          onPressed: () => context.goNamed(InstaRouteNames.editProfile),
        ),
        hasId
            ? const SizedBox(width: 110)
            : PrimaryButton(
                color: InstaColor.primary,
                text: AppLocalizations.of(context)!.viewArchive,
                onPressed: () {},
              ),
      ],
    );
  }
}
