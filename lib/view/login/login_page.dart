import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/auth/auth_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/alert_dialog.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loginListener();
    return InstaAppBar(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.padding +
                  (Breakpoints.small.isActive(context)
                      ? InstaSpacing.verySmall
                      : InstaSpacing.small)),
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: ListView(
              shrinkWrap: true,
              reverse: true,
              children: [
                const SizedBox(height: InstaSpacing.small),
                _buildHeader(),
                const SizedBox(height: InstaSpacing.extraLarge),
                _buildLoginIdentifiers(),
                const SizedBox(height: InstaSpacing.small),
                _buildPassword(),
                const SizedBox(height: InstaSpacing.medium),
                _buildLogin(),
                const SizedBox(height: InstaSpacing.extraLarge * 4),
                _buildRegisterRoute(),
              ].reversed.toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() => Column(
        children: [
          Image.asset(
            IconRes.instagram,
            scale: 1,
            color: applyColor[InstaColor.tertiary],
          ),
          const InstaText(
            text: 'Instaclone',
            fontSize: InstaFontSize.extraLarge,
            fontWeight: FontWeight.bold,
          ),
        ],
      );

  Widget _buildLoginIdentifiers() => InstaTextField(
        label: AppLocalizations.of(context)!.userNameOrEmail,
        controller: _emailController,
      );

  Widget _buildPassword() => InstaTextField(
        label: AppLocalizations.of(context)!.password,
        obscureText: true,
        controller: _passwordController,
      );

  Widget _buildLogin() {
    final loginState = ref.watch(authProvider);
    return PrimaryButton(
      color: InstaColor.secondary,
      width: double.infinity,
      text: AppLocalizations.of(context)!.login,
      onPressed: loginState.maybeWhen(
        orElse: () => _submit,
        loading: null,
      ),
    );
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    ref.read(authProvider.notifier).signin(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
  }

  Widget _buildRegisterRoute() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InstaText(
              text: '${AppLocalizations.of(context)!.dontHaveAnAccount} '),
          InkWell(
            onTap: () => context.goNamed(InstaRouteNames.register),
            child: InstaText(
              text: AppLocalizations.of(context)!.signUp,
              color: applyColor[InstaColor.secondary],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  void _loginListener() {
    ref.listen<AsyncValue<void>>(
      authProvider,
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
