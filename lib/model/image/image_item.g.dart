// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageItemImpl _$$ImageItemImplFromJson(Map<String, dynamic> json) =>
    _$ImageItemImpl(
      userId: json['userId'] as String?,
      imageId: json['imageId'] as String?,
      image: json['image'] as String?,
      likeCount: json['likeCount'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ImageItemImplToJson(_$ImageItemImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'imageId': instance.imageId,
      'image': instance.image,
      'likeCount': instance.likeCount,
      'comments': instance.comments,
    };
