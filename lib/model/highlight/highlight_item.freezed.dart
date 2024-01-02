// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HighlightItem _$HighlightItemFromJson(Map<String, dynamic> json) {
  return _HighlightItem.fromJson(json);
}

/// @nodoc
mixin _$HighlightItem {
  String get userId => throw _privateConstructorUsedError;
  String get highLightId => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HighlightItemCopyWith<HighlightItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightItemCopyWith<$Res> {
  factory $HighlightItemCopyWith(
          HighlightItem value, $Res Function(HighlightItem) then) =
      _$HighlightItemCopyWithImpl<$Res, HighlightItem>;
  @useResult
  $Res call({String userId, String highLightId, List<String>? images});
}

/// @nodoc
class _$HighlightItemCopyWithImpl<$Res, $Val extends HighlightItem>
    implements $HighlightItemCopyWith<$Res> {
  _$HighlightItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? highLightId = null,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      highLightId: null == highLightId
          ? _value.highLightId
          : highLightId // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HighlightItemImplCopyWith<$Res>
    implements $HighlightItemCopyWith<$Res> {
  factory _$$HighlightItemImplCopyWith(
          _$HighlightItemImpl value, $Res Function(_$HighlightItemImpl) then) =
      __$$HighlightItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String highLightId, List<String>? images});
}

/// @nodoc
class __$$HighlightItemImplCopyWithImpl<$Res>
    extends _$HighlightItemCopyWithImpl<$Res, _$HighlightItemImpl>
    implements _$$HighlightItemImplCopyWith<$Res> {
  __$$HighlightItemImplCopyWithImpl(
      _$HighlightItemImpl _value, $Res Function(_$HighlightItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? highLightId = null,
    Object? images = freezed,
  }) {
    return _then(_$HighlightItemImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      highLightId: null == highLightId
          ? _value.highLightId
          : highLightId // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HighlightItemImpl implements _HighlightItem {
  const _$HighlightItemImpl(
      {required this.userId,
      required this.highLightId,
      final List<String>? images})
      : _images = images;

  factory _$HighlightItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightItemImplFromJson(json);

  @override
  final String userId;
  @override
  final String highLightId;
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
  String toString() {
    return 'HighlightItem(userId: $userId, highLightId: $highLightId, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightItemImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.highLightId, highLightId) ||
                other.highLightId == highLightId) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, highLightId,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightItemImplCopyWith<_$HighlightItemImpl> get copyWith =>
      __$$HighlightItemImplCopyWithImpl<_$HighlightItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightItemImplToJson(
      this,
    );
  }
}

abstract class _HighlightItem implements HighlightItem {
  const factory _HighlightItem(
      {required final String userId,
      required final String highLightId,
      final List<String>? images}) = _$HighlightItemImpl;

  factory _HighlightItem.fromJson(Map<String, dynamic> json) =
      _$HighlightItemImpl.fromJson;

  @override
  String get userId;
  @override
  String get highLightId;
  @override
  List<String>? get images;
  @override
  @JsonKey(ignore: true)
  _$$HighlightItemImplCopyWith<_$HighlightItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
