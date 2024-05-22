// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageComment _$ImageCommentFromJson(Map<String, dynamic> json) {
  return _ImageComment.fromJson(json);
}

/// @nodoc
mixin _$ImageComment {
  String? get recipientId => throw _privateConstructorUsedError;
  String? get commenterId => throw _privateConstructorUsedError;
  num? get dateCreated => throw _privateConstructorUsedError;
  String? get imagesId => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCommentCopyWith<ImageComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCommentCopyWith<$Res> {
  factory $ImageCommentCopyWith(
          ImageComment value, $Res Function(ImageComment) then) =
      _$ImageCommentCopyWithImpl<$Res, ImageComment>;
  @useResult
  $Res call(
      {String? recipientId,
      String? commenterId,
      num? dateCreated,
      String? imagesId,
      String? comment});
}

/// @nodoc
class _$ImageCommentCopyWithImpl<$Res, $Val extends ImageComment>
    implements $ImageCommentCopyWith<$Res> {
  _$ImageCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipientId = freezed,
    Object? commenterId = freezed,
    Object? dateCreated = freezed,
    Object? imagesId = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      recipientId: freezed == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String?,
      commenterId: freezed == commenterId
          ? _value.commenterId
          : commenterId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as num?,
      imagesId: freezed == imagesId
          ? _value.imagesId
          : imagesId // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageCommentImplCopyWith<$Res>
    implements $ImageCommentCopyWith<$Res> {
  factory _$$ImageCommentImplCopyWith(
          _$ImageCommentImpl value, $Res Function(_$ImageCommentImpl) then) =
      __$$ImageCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? recipientId,
      String? commenterId,
      num? dateCreated,
      String? imagesId,
      String? comment});
}

/// @nodoc
class __$$ImageCommentImplCopyWithImpl<$Res>
    extends _$ImageCommentCopyWithImpl<$Res, _$ImageCommentImpl>
    implements _$$ImageCommentImplCopyWith<$Res> {
  __$$ImageCommentImplCopyWithImpl(
      _$ImageCommentImpl _value, $Res Function(_$ImageCommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipientId = freezed,
    Object? commenterId = freezed,
    Object? dateCreated = freezed,
    Object? imagesId = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$ImageCommentImpl(
      recipientId: freezed == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String?,
      commenterId: freezed == commenterId
          ? _value.commenterId
          : commenterId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as num?,
      imagesId: freezed == imagesId
          ? _value.imagesId
          : imagesId // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageCommentImpl implements _ImageComment {
  const _$ImageCommentImpl(
      {this.recipientId,
      this.commenterId,
      this.dateCreated,
      this.imagesId,
      this.comment});

  factory _$ImageCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageCommentImplFromJson(json);

  @override
  final String? recipientId;
  @override
  final String? commenterId;
  @override
  final num? dateCreated;
  @override
  final String? imagesId;
  @override
  final String? comment;

  @override
  String toString() {
    return 'ImageComment(recipientId: $recipientId, commenterId: $commenterId, dateCreated: $dateCreated, imagesId: $imagesId, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageCommentImpl &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.commenterId, commenterId) ||
                other.commenterId == commenterId) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.imagesId, imagesId) ||
                other.imagesId == imagesId) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, recipientId, commenterId, dateCreated, imagesId, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageCommentImplCopyWith<_$ImageCommentImpl> get copyWith =>
      __$$ImageCommentImplCopyWithImpl<_$ImageCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageCommentImplToJson(
      this,
    );
  }
}

abstract class _ImageComment implements ImageComment {
  const factory _ImageComment(
      {final String? recipientId,
      final String? commenterId,
      final num? dateCreated,
      final String? imagesId,
      final String? comment}) = _$ImageCommentImpl;

  factory _ImageComment.fromJson(Map<String, dynamic> json) =
      _$ImageCommentImpl.fromJson;

  @override
  String? get recipientId;
  @override
  String? get commenterId;
  @override
  num? get dateCreated;
  @override
  String? get imagesId;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$ImageCommentImplCopyWith<_$ImageCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
