// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserItemImpl _$$UserItemImplFromJson(Map<String, dynamic> json) =>
    _$UserItemImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      details: UserDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserItemImplToJson(_$UserItemImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'details': instance.details,
    };

_$UserDetailsImpl _$$UserDetailsImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailsImpl(
      fullName: json['fullName'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      postCount: json['postCount'] as String? ?? '',
      followerCount: json['followerCount'] as String? ?? '',
      followingCount: json['followingCount'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => VideoDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      highlights: (json['highlights'] as List<dynamic>?)
              ?.map((e) => HighlightItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'userName': instance.userName,
      'description': instance.description,
      'postCount': instance.postCount,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'images': instance.images,
      'videos': instance.videos,
      'highlights': instance.highlights,
    };
