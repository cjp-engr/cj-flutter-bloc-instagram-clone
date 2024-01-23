import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/alert_dialog.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/settings/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _settingsListener(context, ref);
    return InstaAppBar(
      appBarTitle: const InstaText(
        text: 'Settings',
        fontSize: InstaFontSize.large,
        fontWeight: FontWeight.bold,
      ),
      body: Center(
        child: Column(
          children: [
            PrimaryButton(
              color: InstaColor.primary,
              text: 'Log out',
              onPressed: () async {
                ref.read(settingsProvider.notifier).signout();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _settingsListener(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      settingsProvider,
      (prev, next) {
        next.whenOrNull(
          error: (e, st) {
            showAlertDialog(
              context,
              title: e.toString(),
              buttonCancelText: 'OK',
            );
          },
        );
      },
    );
  }
}
