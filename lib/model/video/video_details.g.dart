// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoDetailsImpl _$$VideoDetailsImplFromJson(Map<String, dynamic> json) =>
    _$VideoDetailsImpl(
      userId: json['userId'] as String?,
      videoId: json['videoId'] as String?,
      video: json['video'] as String?,
      likeCount: json['likeCount'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$VideoDetailsImplToJson(_$VideoDetailsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'videoId': instance.videoId,
      'video': instance.video,
      'likeCount': instance.likeCount,
      'comments': instance.comments,
    };
