import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/display_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/update_user_details_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController {
  final WidgetRef ref;

  EditProfileController({required this.ref});

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final user = ref.watch(displayUserDetailsProvider).asData?.value;
    try {
      final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      ref
          .read(updateUserDetailsProvider.notifier)
          .updatePhoto(user!.copyWith(image: pickedImage!.path));
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> removeImage() async {
    try {
      // ignore: empty_catches
    } catch (e) {}
  }
}
