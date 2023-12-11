// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cj_flutter_riverpod_instagram_clone/view/register/notifiers/register_state.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onFullNameChange(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void onUserNameChange(String userName) {
    state = state.copyWith(userName: userName);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}
