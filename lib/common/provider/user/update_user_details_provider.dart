import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cj_flutter_riverpod_instagram_clone/repository/user/user_repository_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_user_details_provider.g.dart';

@Riverpod(keepAlive: true)
class UpdateUserDetails extends _$UpdateUserDetails {
  @override
  FutureOr<void> build() {}

  Future<void> updateDetails(UserDetails details) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => ref.read(userRepositoryProvider).updateDetails(details),
    );
  }
}
