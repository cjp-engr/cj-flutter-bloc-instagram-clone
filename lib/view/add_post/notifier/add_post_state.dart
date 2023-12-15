// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

import 'package:cj_flutter_riverpod_instagram_clone/model/dropped_file.dart';

class AddPostState {
  final List<XFile>? mediaFileList;
  final List<DroppedFile>? droppedFiles;
  final String errorMessage;

  const AddPostState({
    this.mediaFileList,
    this.droppedFiles,
    this.errorMessage = '',
  });

  AddPostState copyWith({
    List<XFile>? mediaFileList,
    List<DroppedFile>? droppedFiles,
    String? errorMessage,
  }) {
    return AddPostState(
      mediaFileList: mediaFileList ?? this.mediaFileList,
      droppedFiles: droppedFiles ?? this.droppedFiles,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
