// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageCommentImpl _$$ImageCommentImplFromJson(Map<String, dynamic> json) =>
    _$ImageCommentImpl(
      recipientId: json['recipientId'] as String?,
      commenterId: json['commenterId'] as String?,
      dateCreated: json['dateCreated'] as num?,
      imagesId: json['imagesId'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$ImageCommentImplToJson(_$ImageCommentImpl instance) =>
    <String, dynamic>{
      'recipientId': instance.recipientId,
      'commenterId': instance.commenterId,
      'dateCreated': instance.dateCreated,
      'imagesId': instance.imagesId,
      'comment': instance.comment,
    };
