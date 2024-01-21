import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/login/provider/login_provider.dart';
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
    ref.listen<AsyncValue<void>>(
      loginProvider,
      (prev, next) {
        next.whenOrNull(
          error: (e, st) {
            print('Got an error!');
          },
        );
      },
    );
    return InstaAppBar(
      body: Padding(
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
              const SizedBox(height: InstaSpacing.extraLarge * 2),
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
    );
  }

  Widget _buildHeader() => const InstaText(
        text: 'Instaclone',
        fontSize: InstaFontSize.extraLarge,
        fontWeight: FontWeight.bold,
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
    final loginState = ref.watch(loginProvider);
    return InstaButton(
      width: double.infinity,
      buttonType: InstaButtonType.secondary,
      text: AppLocalizations.of(context)!.login,
      onPressed: loginState.maybeWhen(
        loading: () => null,
        orElse: () => _submit,
      ),
    );
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    ref.read(loginProvider.notifier).signin(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

    context.goNamed(InstaRouteNames.profile);
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
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
