import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/display_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/update_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/alert_dialog.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(displayUserDetailsProvider);
    _updateUserListener();
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
                          _buildImage(),
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

  Widget _buildImage() {
    return const InstaCircleAvatar(
      image: IconRes.testOnly,
      radius: InstaCircleAvatarSize.large,
    );
  }

  Widget _buildFullName(String fullName) {
    return InstaTextField(
      label: AppLocalizations.of(context)!.fullName,
      controller: _fullNameController,
      initialValue: fullName,
      onChanged: (value) {
        _fullNameController.text == value;
      },
    );
  }

  Widget _buildUserName(String userName) {
    return InstaTextField(
      label: AppLocalizations.of(context)!.userName,
      controller: _userNameController,
      initialValue: userName,
      onChanged: (value) {
        setState(() {
          _userNameController.text == value;
        });
      },
    );
  }

  Widget _buildEmail(String email) {
    return InstaTextField(
      label: AppLocalizations.of(context)!.email,
      controller: _emailController,
      initialValue: email,
      onChanged: (value) {
        setState(() {
          _emailController.text = value;
        });
      },
    );
  }

  Widget _buildDescription(String description) {
    return InstaTextField(
      label: AppLocalizations.of(context)!.description,
      maxLines: 4,
      controller: _descriptionController,
      initialValue: description,
      onChanged: (value) {
        setState(() {
          _descriptionController.text = value;
        });
      },
    );
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    ref.read(updateUserDetailsProvider.notifier).updateDetails(
          UserDetails(
            email: _emailController.text.trim(),
            fullName: _fullNameController.text.trim(),
            userName: _userNameController.text.trim(),
            description: _descriptionController.text.trim(),
          ),
        );
  }

  void _updateUserListener() {
    ref.listen<AsyncValue<void>>(
      updateUserDetailsProvider,
      (prev, next) {
        next.whenOrNull(
          data: (_) {
            context.goNamed(InstaRouteNames.profile);
          },
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
