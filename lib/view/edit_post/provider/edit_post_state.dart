// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

class EditPostState {
  final ImageDetails? imageDetails;
  final int previewImageIndex;
  final List<String> mediaToRemove;
  final String errorMessage;

  EditPostState({
    this.imageDetails,
    this.previewImageIndex = 0,
    this.mediaToRemove = const [],
    this.errorMessage = '',
  });

  EditPostState copyWith({
    ImageDetails? imageDetails,
    int? previewImageIndex,
    List<String>? mediaToRemove,
    String? errorMessage,
  }) {
    return EditPostState(
      imageDetails: imageDetails ?? this.imageDetails,
      previewImageIndex: previewImageIndex ?? this.previewImageIndex,
      mediaToRemove: mediaToRemove ?? this.mediaToRemove,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
