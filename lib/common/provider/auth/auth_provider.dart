import 'package:cj_flutter_riverpod_instagram_clone/repository/auth/auth_repository_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
  }

  Future<void> signUp({
    required UserItem user,
  }) async {
    state = const AsyncLoading<void>();
    final key = _key;

    final newState = await AsyncValue.guard<void>(
      () => ref.read(authRepositoryProvider).signup(user: user),
    );

    if (key == _key) {
      state = newState;
    }
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(
      () => ref
          .read(authRepositoryProvider)
          .signin(email: email, password: password),
    );
  }

  Future<void> signout() async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(
      () => ref.read(authRepositoryProvider).signout(),
    );
  }
}
