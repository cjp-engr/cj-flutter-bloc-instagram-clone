// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

class AddPostState {
  final List<XFile>? mediaFileList;
  final String errorMessage;

  const AddPostState({
    this.mediaFileList,
    this.errorMessage = '',
  });

  AddPostState copyWith({
    List<XFile>? mediaFileList,
    String? errorMessage,
  }) {
    return AddPostState(
      mediaFileList: mediaFileList ?? this.mediaFileList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
