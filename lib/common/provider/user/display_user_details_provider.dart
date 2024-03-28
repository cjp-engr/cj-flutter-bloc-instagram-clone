import 'package:cj_flutter_riverpod_instagram_clone/model/user/user.dart';
import 'package:cj_flutter_riverpod_instagram_clone/repository/user/user_repository_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'display_user_details_provider.g.dart';

@Riverpod(keepAlive: true)
class DisplayUserDetails extends _$DisplayUserDetails {
  @override
  FutureOr<UserDetails?> build() {
    return Future<UserDetails?>.value(null);
  }

  Future<void> getUserDetails() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final details = await ref.read(userRepositoryProvider).getDetails();
      return details;
    });
  }
}
