// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

class AddPostState {
  final List<XFile>? mediaFileList;
  final String errorMessage;
  final bool isVideo;

  const AddPostState({
    this.mediaFileList,
    this.errorMessage = '',
    this.isVideo = false,
  });

  AddPostState copyWith({
    List<XFile>? mediaFileList,
    String? errorMessage,
    bool? isVideo,
  }) {
    return AddPostState(
      mediaFileList: mediaFileList ?? this.mediaFileList,
      errorMessage: errorMessage ?? this.errorMessage,
      isVideo: isVideo ?? this.isVideo,
    );
  }
}
