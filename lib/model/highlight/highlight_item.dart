import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_item.freezed.dart';
part 'highlight_item.g.dart';

@freezed
class HighlightItem with _$HighlightItem {
  const factory HighlightItem({
    required String userId,
    required String highLightId,
    List<String>? images,
  }) = _HighlightItem;

  factory HighlightItem.fromJson(Map<String, Object?> json) =>
      _$HighlightItemFromJson(json);
}
