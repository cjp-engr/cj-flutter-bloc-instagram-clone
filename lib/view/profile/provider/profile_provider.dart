// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cj_flutter_riverpod_instagram_clone/view/profile/provider/profile_state.dart';

part 'profile_provider.g.dart';

@Riverpod(keepAlive: true)
class Profile extends _$Profile {
  @override
  ProfileState build() {
    return ProfileState();
  }

  void scrollToIndex(int index) {
    state = state.copyWith(scrollToIndex: index);
  }
}
