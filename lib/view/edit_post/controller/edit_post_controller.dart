import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_post/provider/edit_post_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPostController {
  final WidgetRef ref;

  EditPostController({required this.ref});

  //! START - For mobile when removing an image from preview
  void removeMedia(ImageDetails details, String url) {
    final updateState = ref.read(editPostProvider.notifier);
    List<String>? images = details.images!.toList();
    images.removeWhere((images) => images == url);
    updateState.removeImages(images, url);
  }
  //! END - For mobile when removing an image from preview

  //! START - For mobile when updating the uploaded media
  void updateImages(ImageDetails details) {
    final deleteImages = ref.watch(editPostProvider).mediaToRemove;
    ref.read(imagesProvider.notifier).updateImages(details, deleteImages);
  }
  //! END - For mobile when updating the uploaded media
}
