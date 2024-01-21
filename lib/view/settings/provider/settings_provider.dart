import 'package:cj_flutter_riverpod_instagram_clone/repository/auth/auth_repository_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  FutureOr<void> build() {}

  Future<void> signout() async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(
      () => ref.read(authRepositoryProvider).signout(),
    );
  }
}
