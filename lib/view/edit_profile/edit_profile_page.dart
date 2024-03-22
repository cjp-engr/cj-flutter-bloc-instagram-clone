import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/user_details_action_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userDetailsActionProvider);

    return user.when(
      data: (data) {
        return InstaAppBar(
          appBarTitle: const InstaText(
            text: 'Edit Profile',
            fontSize: InstaFontSize.large,
            fontWeight: FontWeight.bold,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.padding),
              child: Center(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      autovalidateMode: _autovalidateMode,
                      child: ListView(
                        shrinkWrap: true,
                        reverse: true,
                        children: [
                          const SizedBox(height: InstaSpacing.small),
                          _buildFullName(data?.fullName ?? ''),
                          const SizedBox(height: InstaSpacing.small),
                          _buildUserName(data?.userName ?? ''),
                          const SizedBox(height: InstaSpacing.small),
                          _buildEmail(data?.email ?? ''),
                          const SizedBox(height: InstaSpacing.small),
                          _buildDescription(data?.description ?? ''),
                          const SizedBox(height: InstaSpacing.small),
                        ].reversed.toList(),
                      ),
                    ),
                    PrimaryButton(
                      color: InstaColor.primary,
                      text: 'Save',
                      onPressed: _submit,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return const Text('there is an error');
      },
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildFullName(String fullName) => InstaTextField(
        label: AppLocalizations.of(context)!.fullName,
        initialValue: fullName,
      );

  Widget _buildUserName(String userName) => InstaTextField(
        label: AppLocalizations.of(context)!.userName,
        initialValue: userName,
      );

  Widget _buildEmail(String email) => InstaTextField(
        label: AppLocalizations.of(context)!.email,
        initialValue: email,
      );

  Widget _buildDescription(String description) => InstaTextField(
        label: AppLocalizations.of(context)!.description,
        maxLines: 4,
        initialValue: description,
      );

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;
  }
}
