// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageDetailsImpl _$$ImageDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ImageDetailsImpl(
      userId: json['userId'] as String?,
      imageId: json['imageId'] as String?,
      image: json['image'] as String?,
      likeCount: json['likeCount'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ImageDetailsImplToJson(_$ImageDetailsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'imageId': instance.imageId,
      'image': instance.image,
      'likeCount': instance.likeCount,
      'comments': instance.comments,
    };
