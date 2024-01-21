import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_details.freezed.dart';
part 'video_details.g.dart';

@freezed
class VideoDetails with _$VideoDetails {
  const factory VideoDetails({
    String? userId,
    String? videoId,
    String? video,
    String? likeCount,
    List<String>? comments,
  }) = _VideoDetails;

  factory VideoDetails.fromJson(Map<String, Object?> json) =>
      _$VideoDetailsFromJson(json);
}
