import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditPostController {
  final WidgetRef ref;

  EditPostController({required this.ref});

  final ImagePicker _picker = ImagePicker();

  //! START - For mobile when removing an image from preview
  void removeMedia(int index) {}
  //! END - For mobile when removing an image from preview
}
