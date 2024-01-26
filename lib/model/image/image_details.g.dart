// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageDetailsImpl _$$ImageDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ImageDetailsImpl(
      userId: json['userId'] as String?,
      imagesId: json['imagesId'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      likeCount: json['likeCount'] as int?,
      description: json['description'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ImageDetailsImplToJson(_$ImageDetailsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'imagesId': instance.imagesId,
      'images': instance.images,
      'likeCount': instance.likeCount,
      'description': instance.description,
      'comments': instance.comments,
    };
