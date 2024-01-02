// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoItemImpl _$$VideoItemImplFromJson(Map<String, dynamic> json) =>
    _$VideoItemImpl(
      userId: json['userId'] as String?,
      videoId: json['videoId'] as String?,
      video: json['video'] as String?,
      likeCount: json['likeCount'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$VideoItemImplToJson(_$VideoItemImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'videoId': instance.videoId,
      'video': instance.video,
      'likeCount': instance.likeCount,
      'comments': instance.comments,
    };
