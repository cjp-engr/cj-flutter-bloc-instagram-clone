class LoginState {
  final String email;

  final String userName;
  final String password;

  LoginState({
    required this.email,
    required this.userName,
    required this.password,
  });

  LoginState copyWith({
    String? email,
    String? userName,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}
