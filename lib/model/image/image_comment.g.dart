// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageCommentImpl _$$ImageCommentImplFromJson(Map<String, dynamic> json) =>
    _$ImageCommentImpl(
      id: json['id'] as String?,
      imagesId: json['imagesId'] as String?,
      recipientId: json['recipientId'] as String?,
      commenterId: json['commenterId'] as String?,
      commenterImage: json['commenterImage'] as String?,
      commenterUsername: json['commenterUsername'] as String?,
      timeDifference: json['timeDifference'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$ImageCommentImplToJson(_$ImageCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imagesId': instance.imagesId,
      'recipientId': instance.recipientId,
      'commenterId': instance.commenterId,
      'commenterImage': instance.commenterImage,
      'commenterUsername': instance.commenterUsername,
      'timeDifference': instance.timeDifference,
      'comment': instance.comment,
    };
