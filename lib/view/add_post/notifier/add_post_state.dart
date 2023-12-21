// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

import 'package:cj_flutter_riverpod_instagram_clone/model/dropped_file.dart';

class AddPostState {
  final List<XFile>? mediaFileList;
  final List<DroppedFile>? droppedImages;
  final XFile? previewImage;
  final int previewImageIndex;
  final String errorMessage;

  const AddPostState({
    this.mediaFileList,
    this.droppedImages,
    this.previewImage,
    this.previewImageIndex = 0,
    this.errorMessage = '',
  });

  AddPostState copyWith({
    List<XFile>? mediaFileList,
    List<DroppedFile>? droppedImages,
    XFile? previewImage,
    int? previewImageIndex,
    String? errorMessage,
  }) {
    return AddPostState(
      mediaFileList: mediaFileList ?? this.mediaFileList,
      droppedImages: droppedImages ?? this.droppedImages,
      previewImage: previewImage ?? this.previewImage,
      previewImageIndex: previewImageIndex ?? this.previewImageIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
