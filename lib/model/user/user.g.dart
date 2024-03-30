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
      email: json['email'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      followings: (json['followings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'userName': instance.userName,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'followers': instance.followers,
      'followings': instance.followings,
    };
