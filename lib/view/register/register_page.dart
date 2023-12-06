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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String registerIdentifiers = '';
  String fullName = '';
  String userName = '';
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
            _buildAppName(),
            const SizedBox(height: InstaSpacing.extraLarge),
            _buildSubHeader(),
            const SizedBox(height: InstaSpacing.extraLarge),
            _buildRegisterIdentifier(),
            const SizedBox(height: InstaSpacing.small),
            _buildFullName(),
            const SizedBox(height: InstaSpacing.small),
            _buildUserName(),
            const SizedBox(height: InstaSpacing.small),
            _buildPassword(),
            const SizedBox(height: InstaSpacing.small),
            _buildLearnMore(),
            const SizedBox(height: InstaSpacing.small),
            _buildPolicy(),
            const SizedBox(height: InstaSpacing.small),
            _buildSignUp(),
            const SizedBox(height: InstaSpacing.large),
            _buildLoginRoute(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppName() => const InstaText(
        text: 'Instaclone',
        fontSize: InstaFontSize.extraLarge,
        fontWeight: FontWeight.bold,
      );

  Widget _buildSubHeader() => InstaText(
        text: AppLocalizations.of(context)!.registerSubHeader,
      );

  Widget _buildRegisterIdentifier() => InstaTextField(
        label: AppLocalizations.of(context)!.email,
        onChanged: (text) {
          registerIdentifiers = text;
        },
      );

  Widget _buildFullName() => InstaTextField(
        label: AppLocalizations.of(context)!.fullName,
        onChanged: (text) {
          fullName = text;
        },
      );

  Widget _buildUserName() => InstaTextField(
        label: AppLocalizations.of(context)!.userName,
        onChanged: (text) {
          userName = text;
        },
      );

  Widget _buildPassword() => InstaTextField(
        label: AppLocalizations.of(context)!.password,
        onChanged: (text) {
          password = text;
        },
      );

  Widget _buildLearnMore() => InstaText(
        text: AppLocalizations.of(context)!.registerLearnMore,
        color: Colors.grey,
      );

  Widget _buildPolicy() => InstaText(
        text: AppLocalizations.of(context)!.registerPolicy,
        color: Colors.grey,
      );

  Widget _buildSignUp() => InstaButton(
        width: double.infinity,
        buttonType: InstaButtonType.secondary,
        text: AppLocalizations.of(context)!.signUp,
        onPressed: () {},
      );

  Widget _buildLoginRoute() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InstaText(text: '${AppLocalizations.of(context)!.haveAnAccount} '),
          InkWell(
            onTap: () => context.goNamed(InstaRouteNames.login),
            child: InstaText(
              text: AppLocalizations.of(context)!.login,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
