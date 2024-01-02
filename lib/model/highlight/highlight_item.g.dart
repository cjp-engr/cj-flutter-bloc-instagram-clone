// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightItemImpl _$$HighlightItemImplFromJson(Map<String, dynamic> json) =>
    _$HighlightItemImpl(
      userId: json['userId'] as String,
      highLightId: json['highLightId'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$HighlightItemImplToJson(_$HighlightItemImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'highLightId': instance.highLightId,
      'images': instance.images,
    };
