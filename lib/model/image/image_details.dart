import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_details.freezed.dart';
part 'image_details.g.dart';

@freezed
class ImageDetails with _$ImageDetails {
  const factory ImageDetails({
    String? userId,
    String? imageId,
    String? image,
    String? likeCount,
    List<String>? comments,
  }) = _ImageDetails;

  factory ImageDetails.fromJson(Map<String, Object?> json) =>
      _$ImageDetailsFromJson(json);
}
