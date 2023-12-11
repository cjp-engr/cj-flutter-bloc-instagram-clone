// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cj_flutter_riverpod_instagram_clone/view/register/notifier/register_state.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void enterEmail(String email) {
    state = state.copyWith(email: email);
  }

  void enterFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void enterUserName(String userName) {
    state = state.copyWith(userName: userName);
  }

  void enterPassword(String password) {
    state = state.copyWith(password: password);
  }
}
