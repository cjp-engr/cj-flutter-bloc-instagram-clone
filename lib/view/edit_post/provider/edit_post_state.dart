// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

class EditPostState {
  final ImageDetails? images;
  final int previewImageIndex;
  final String errorMessage;

  EditPostState({
    this.images,
    this.previewImageIndex = 0,
    this.errorMessage = '',
  });

  EditPostState copyWith({
    ImageDetails? images,
    int? previewImageIndex,
    String? errorMessage,
  }) {
    return EditPostState(
      images: images ?? this.images,
      previewImageIndex: previewImageIndex ?? this.previewImageIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
