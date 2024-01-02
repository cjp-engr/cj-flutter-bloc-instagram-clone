import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_item.freezed.dart';
part 'video_item.g.dart';

@freezed
class VideoItem with _$VideoItem {
  const factory VideoItem({
    String? userId,
    String? videoId,
    String? video,
    String? likeCount,
    List<String>? comments,
  }) = _VideoItem;

  factory VideoItem.fromJson(Map<String, Object?> json) =>
      _$VideoItemFromJson(json);
}
