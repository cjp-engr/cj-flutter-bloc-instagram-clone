import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_comment.freezed.dart';
part 'image_comment.g.dart';

@freezed
class ImageComment with _$ImageComment {
  const factory ImageComment({
    String? id,
    String? recipientId,
    String? commenterId,
    num? dateCreated,
    String? imagesId,
    String? comment,
  }) = _ImageComment;

  factory ImageComment.fromJson(Map<String, Object?> json) =>
      _$ImageCommentFromJson(json);
}
