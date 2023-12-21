// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

import 'package:cj_flutter_riverpod_instagram_clone/model/dropped_file.dart';

class AddPostState {
  final List<XFile>? mediaFileList;
  final List<DroppedFile>? droppedImages;
  final String errorMessage;
  final String pathImageSelected;

  const AddPostState({
    this.mediaFileList,
    this.droppedImages,
    this.errorMessage = '',
    this.pathImageSelected = '',
  });

  AddPostState copyWith({
    List<XFile>? mediaFileList,
    List<DroppedFile>? droppedImages,
    String? errorMessage,
    String? pathImageSelected,
  }) {
    return AddPostState(
      mediaFileList: mediaFileList ?? this.mediaFileList,
      droppedImages: droppedImages ?? this.droppedImages,
      errorMessage: errorMessage ?? this.errorMessage,
      pathImageSelected: pathImageSelected ?? this.pathImageSelected,
    );
  }
}
