import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_item.freezed.dart';
part 'image_item.g.dart';

@freezed
class ImageItem with _$ImageItem {
  const factory ImageItem({
    String? userId,
    String? imageId,
    String? image,
    String? likeCount,
    List<String>? comments,
  }) = _ImageItem;

  factory ImageItem.fromJson(Map<String, Object?> json) =>
      _$ImageItemFromJson(json);
}
