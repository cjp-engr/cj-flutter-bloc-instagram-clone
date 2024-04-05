import 'package:cj_flutter_riverpod_instagram_clone/view/profile/provider/profile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileController {
  final WidgetRef ref;

  ProfileController({required this.ref});

  void getMediaIndexToView(int index) {
    final pState = ref.read(profileProvider.notifier);
    pState.scrollToIndex(index);
  }
}
