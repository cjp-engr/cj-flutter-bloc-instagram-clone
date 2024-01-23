import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/alert_dialog.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/register/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _registerListener();
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
              ].reversed.toList(),
            ),
          ),
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
        controller: _emailController,
      );

  Widget _buildFullName() => InstaTextField(
        label: AppLocalizations.of(context)!.fullName,
        controller: _fullNameController,
      );

  Widget _buildUserName() => InstaTextField(
        label: AppLocalizations.of(context)!.userName,
        controller: _userNameController,
      );

  Widget _buildPassword() => InstaTextField(
        label: AppLocalizations.of(context)!.password,
        obscureText: true,
        controller: _passwordController,
      );

  Widget _buildLearnMore() => InstaText(
        text: AppLocalizations.of(context)!.registerLearnMore,
        color: Colors.grey,
      );

  Widget _buildPolicy() => InstaText(
        text: AppLocalizations.of(context)!.registerPolicy,
        color: Colors.grey,
      );

  Widget _buildSignUp() => PrimaryButton(
        color: InstaColor.secondary,
        width: double.infinity,
        text: AppLocalizations.of(context)!.signUp,
        onPressed: _submit,
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

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    ref.read(registerProvider.notifier).signUp(
          user: UserItem(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            details: UserDetails(
              fullName: _fullNameController.text.trim(),
              userName: _userNameController.text.trim(),
            ),
          ),
        );
  }

  void _registerListener() {
    ref.listen<AsyncValue<void>>(
      registerProvider,
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
