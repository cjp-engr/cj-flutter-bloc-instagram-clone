import 'package:cj_flutter_riverpod_instagram_clone/repository/auth/auth_repository_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() {
      print('[signupProvider] disposed');
      _key = null;
    });
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
}
