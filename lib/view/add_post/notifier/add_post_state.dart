// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

import 'package:cj_flutter_riverpod_instagram_clone/model/dropped_file.dart';

class AddPostState {
  final List<XFile>? mediaFileList;
  final DroppedFile? droppedFile;
  final String errorMessage;

  const AddPostState({
    this.mediaFileList,
    this.droppedFile,
    this.errorMessage = '',
  });

  AddPostState copyWith({
    List<XFile>? mediaFileList,
    DroppedFile? droppedFile,
    String? errorMessage,
  }) {
    return AddPostState(
      mediaFileList: mediaFileList ?? this.mediaFileList,
      droppedFile: droppedFile ?? this.droppedFile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
