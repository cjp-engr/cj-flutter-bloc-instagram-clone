// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoItem _$VideoItemFromJson(Map<String, dynamic> json) {
  return _VideoItem.fromJson(json);
}

/// @nodoc
mixin _$VideoItem {
  String? get userId => throw _privateConstructorUsedError;
  String? get videoId => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get likeCount => throw _privateConstructorUsedError;
  List<String>? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoItemCopyWith<VideoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoItemCopyWith<$Res> {
  factory $VideoItemCopyWith(VideoItem value, $Res Function(VideoItem) then) =
      _$VideoItemCopyWithImpl<$Res, VideoItem>;
  @useResult
  $Res call(
      {String? userId,
      String? videoId,
      String? video,
      String? likeCount,
      List<String>? comments});
}

/// @nodoc
class _$VideoItemCopyWithImpl<$Res, $Val extends VideoItem>
    implements $VideoItemCopyWith<$Res> {
  _$VideoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? videoId = freezed,
    Object? video = freezed,
    Object? likeCount = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoItemImplCopyWith<$Res>
    implements $VideoItemCopyWith<$Res> {
  factory _$$VideoItemImplCopyWith(
          _$VideoItemImpl value, $Res Function(_$VideoItemImpl) then) =
      __$$VideoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? videoId,
      String? video,
      String? likeCount,
      List<String>? comments});
}

/// @nodoc
class __$$VideoItemImplCopyWithImpl<$Res>
    extends _$VideoItemCopyWithImpl<$Res, _$VideoItemImpl>
    implements _$$VideoItemImplCopyWith<$Res> {
  __$$VideoItemImplCopyWithImpl(
      _$VideoItemImpl _value, $Res Function(_$VideoItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? videoId = freezed,
    Object? video = freezed,
    Object? likeCount = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$VideoItemImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
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
class _$VideoItemImpl implements _VideoItem {
  const _$VideoItemImpl(
      {this.userId,
      this.videoId,
      this.video,
      this.likeCount,
      final List<String>? comments})
      : _comments = comments;

  factory _$VideoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoItemImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? videoId;
  @override
  final String? video;
  @override
  final String? likeCount;
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
    return 'VideoItem(userId: $userId, videoId: $videoId, video: $video, likeCount: $likeCount, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoItemImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, videoId, video,
      likeCount, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoItemImplCopyWith<_$VideoItemImpl> get copyWith =>
      __$$VideoItemImplCopyWithImpl<_$VideoItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoItemImplToJson(
      this,
    );
  }
}

abstract class _VideoItem implements VideoItem {
  const factory _VideoItem(
      {final String? userId,
      final String? videoId,
      final String? video,
      final String? likeCount,
      final List<String>? comments}) = _$VideoItemImpl;

  factory _VideoItem.fromJson(Map<String, dynamic> json) =
      _$VideoItemImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get videoId;
  @override
  String? get video;
  @override
  String? get likeCount;
  @override
  List<String>? get comments;
  @override
  @JsonKey(ignore: true)
  _$$VideoItemImplCopyWith<_$VideoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
