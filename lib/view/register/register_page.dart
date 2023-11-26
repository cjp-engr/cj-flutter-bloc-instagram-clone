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
            _buildHeader(),
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

  Widget _buildHeader() => const InstaText(
        text: 'Instaclone',
        fontSize: InstaFontSize.extraLarge,
        fontWeight: FontWeight.bold,
      );

  Widget _buildSubHeader() => const InstaText(
        text:
            'Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo.',
      );

  Widget _buildRegisterIdentifier() => InstaTextField(
        label: 'Mobile Number or Email',
        onChanged: (text) {
          registerIdentifiers = text;
        },
      );

  Widget _buildFullName() => InstaTextField(
        label: 'Full Name',
        onChanged: (text) {
          fullName = text;
        },
      );

  Widget _buildUserName() => InstaTextField(
        label: 'Username',
        onChanged: (text) {
          userName = text;
        },
      );

  Widget _buildPassword() => InstaTextField(
        label: 'Password',
        onChanged: (text) {
          password = text;
        },
      );

  Widget _buildLearnMore() => const InstaText(
        text:
            'Morbi vestibulum volutpat enim. Duis lobortis. In turpis. Donec at ante non massa id feugiat.',
        color: Colors.grey,
      );

  Widget _buildPolicy() => const InstaText(
        text: 'Mauris eget neque at sem venenatis eleifend.',
        color: Colors.grey,
      );

  Widget _buildSignUp() => InstaButton(
        width: double.infinity,
        buttonType: InstaButtonType.secondary,
        text: 'Sign up',
        onPressed: () {},
      );

  Widget _buildLoginRoute() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const InstaText(text: 'Have an account? '),
          InkWell(
            onTap: () => context.goNamed(InstaRouteNames.login),
            child: const InstaText(
              text: 'Log in',
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
