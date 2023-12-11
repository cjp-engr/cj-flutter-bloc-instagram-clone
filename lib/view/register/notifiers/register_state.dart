// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterState {
  final String email;
  final String fullName;
  final String userName;
  final String password;

  RegisterState({
    this.email = '',
    this.fullName = '',
    this.userName = '',
    this.password = '',
  });

  RegisterState copyWith({
    String? email,
    String? fullName,
    String? userName,
    String? password,
  }) {
    return RegisterState(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}
