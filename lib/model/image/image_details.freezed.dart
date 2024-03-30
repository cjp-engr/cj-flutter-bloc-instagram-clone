// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageDetails _$ImageDetailsFromJson(Map<String, dynamic> json) {
  return _ImageDetails.fromJson(json);
}

/// @nodoc
mixin _$ImageDetails {
  String? get userId => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get userImage => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get imagesId => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDetailsCopyWith<ImageDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDetailsCopyWith<$Res> {
  factory $ImageDetailsCopyWith(
          ImageDetails value, $Res Function(ImageDetails) then) =
      _$ImageDetailsCopyWithImpl<$Res, ImageDetails>;
  @useResult
  $Res call(
      {String? userId,
      String? userName,
      String? userImage,
      String? location,
      String? imagesId,
      List<String>? images,
      int? likeCount,
      String? description,
      List<String>? comments});
}

/// @nodoc
class _$ImageDetailsCopyWithImpl<$Res, $Val extends ImageDetails>
    implements $ImageDetailsCopyWith<$Res> {
  _$ImageDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? userImage = freezed,
    Object? location = freezed,
    Object? imagesId = freezed,
    Object? images = freezed,
    Object? likeCount = freezed,
    Object? description = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesId: freezed == imagesId
          ? _value.imagesId
          : imagesId // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageDetailsImplCopyWith<$Res>
    implements $ImageDetailsCopyWith<$Res> {
  factory _$$ImageDetailsImplCopyWith(
          _$ImageDetailsImpl value, $Res Function(_$ImageDetailsImpl) then) =
      __$$ImageDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? userName,
      String? userImage,
      String? location,
      String? imagesId,
      List<String>? images,
      int? likeCount,
      String? description,
      List<String>? comments});
}

/// @nodoc
class __$$ImageDetailsImplCopyWithImpl<$Res>
    extends _$ImageDetailsCopyWithImpl<$Res, _$ImageDetailsImpl>
    implements _$$ImageDetailsImplCopyWith<$Res> {
  __$$ImageDetailsImplCopyWithImpl(
      _$ImageDetailsImpl _value, $Res Function(_$ImageDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? userImage = freezed,
    Object? location = freezed,
    Object? imagesId = freezed,
    Object? images = freezed,
    Object? likeCount = freezed,
    Object? description = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$ImageDetailsImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesId: freezed == imagesId
          ? _value.imagesId
          : imagesId // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageDetailsImpl implements _ImageDetails {
  const _$ImageDetailsImpl(
      {this.userId,
      this.userName,
      this.userImage,
      this.location,
      this.imagesId,
      final List<String>? images,
      this.likeCount,
      this.description,
      final List<String>? comments})
      : _images = images,
        _comments = comments;

  factory _$ImageDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageDetailsImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? userName;
  @override
  final String? userImage;
  @override
  final String? location;
  @override
  final String? imagesId;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? likeCount;
  @override
  final String? description;
  final List<String>? _comments;
  @override
  List<String>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ImageDetails(userId: $userId, userName: $userName, userImage: $userImage, location: $location, imagesId: $imagesId, images: $images, likeCount: $likeCount, description: $description, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageDetailsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imagesId, imagesId) ||
                other.imagesId == imagesId) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      userImage,
      location,
      imagesId,
      const DeepCollectionEquality().hash(_images),
      likeCount,
      description,
      const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageDetailsImplCopyWith<_$ImageDetailsImpl> get copyWith =>
      __$$ImageDetailsImplCopyWithImpl<_$ImageDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageDetailsImplToJson(
      this,
    );
  }
}

abstract class _ImageDetails implements ImageDetails {
  const factory _ImageDetails(
      {final String? userId,
      final String? userName,
      final String? userImage,
      final String? location,
      final String? imagesId,
      final List<String>? images,
      final int? likeCount,
      final String? description,
      final List<String>? comments}) = _$ImageDetailsImpl;

  factory _ImageDetails.fromJson(Map<String, dynamic> json) =
      _$ImageDetailsImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get userName;
  @override
  String? get userImage;
  @override
  String? get location;
  @override
  String? get imagesId;
  @override
  List<String>? get images;
  @override
  int? get likeCount;
  @override
  String? get description;
  @override
  List<String>? get comments;
  @override
  @JsonKey(ignore: true)
  _$$ImageDetailsImplCopyWith<_$ImageDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
