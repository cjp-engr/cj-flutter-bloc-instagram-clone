import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginIdentifier = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.padding +
                (Breakpoints.small.isActive(context)
                    ? InstaSpacing.verySmall
                    : InstaSpacing.small)),
        child: Column(
          children: [
            const SizedBox(height: InstaSpacing.small),
            _buildHeader(),
            const SizedBox(height: InstaSpacing.extraLarge * 2),
            _buildLoginIdentifiers(),
            const SizedBox(height: InstaSpacing.small),
            _buildPassword(),
            const SizedBox(height: InstaSpacing.medium),
            _buildLogin(),
            const SizedBox(height: InstaSpacing.extraLarge * 4),
            _buildRegisterRoute(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => const InstaText(
        text: 'Instaclone',
        fontSize: InstaFontSize.extraLarge,
        fontWeight: FontWeight.bold,
      );

  Widget _buildLoginIdentifiers() => InstaTextField(
        label: AppLocalizations.of(context)!.userNameOrEmail,
        onChanged: (text) {
          loginIdentifier = text;
        },
      );

  Widget _buildPassword() => InstaTextField(
        label: AppLocalizations.of(context)!.password,
        onChanged: (text) {
          password = text;
        },
      );

  Widget _buildLogin() => InstaButton(
        width: double.infinity,
        buttonType: InstaButtonType.secondary,
        text: AppLocalizations.of(context)!.login,
        onPressed: () {},
      );

  Widget _buildRegisterRoute() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InstaText(
              text: '${AppLocalizations.of(context)!.dontHaveAnAccount} '),
          InkWell(
            onTap: () => context.goNamed(InstaRouteNames.register),
            child: InstaText(
              text: AppLocalizations.of(context)!.signUp,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
