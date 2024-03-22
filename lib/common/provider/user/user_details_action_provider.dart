import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cj_flutter_riverpod_instagram_clone/repository/user/user_repository_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_details_action_provider.g.dart';

@Riverpod(keepAlive: true)
class UserDetailsAction extends _$UserDetailsAction {
  @override
  FutureOr<UserDetails?> build() {
    return Future<UserDetails?>.value(null);
  }

  Future<void> getUserDetails() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final images = await ref.read(userRepositoryProvider).getDetails();
      return images;
    });
  }

  Future<void> updateUserDetails(UserDetails details) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(userRepositoryProvider).updateDetails(details);
      return null;
    });
  }
}
