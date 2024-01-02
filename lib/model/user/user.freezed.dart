// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserItem _$UserItemFromJson(Map<String, dynamic> json) {
  return _UserItem.fromJson(json);
}

/// @nodoc
mixin _$UserItem {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  UserDetails get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserItemCopyWith<UserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserItemCopyWith<$Res> {
  factory $UserItemCopyWith(UserItem value, $Res Function(UserItem) then) =
      _$UserItemCopyWithImpl<$Res, UserItem>;
  @useResult
  $Res call({String email, String password, UserDetails details});

  $UserDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$UserItemCopyWithImpl<$Res, $Val extends UserItem>
    implements $UserItemCopyWith<$Res> {
  _$UserItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as UserDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res> get details {
    return $UserDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserItemImplCopyWith<$Res>
    implements $UserItemCopyWith<$Res> {
  factory _$$UserItemImplCopyWith(
          _$UserItemImpl value, $Res Function(_$UserItemImpl) then) =
      __$$UserItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, UserDetails details});

  @override
  $UserDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$UserItemImplCopyWithImpl<$Res>
    extends _$UserItemCopyWithImpl<$Res, _$UserItemImpl>
    implements _$$UserItemImplCopyWith<$Res> {
  __$$UserItemImplCopyWithImpl(
      _$UserItemImpl _value, $Res Function(_$UserItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? details = null,
  }) {
    return _then(_$UserItemImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as UserDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserItemImpl implements _UserItem {
  const _$UserItemImpl(
      {required this.email, required this.password, required this.details});

  factory _$UserItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserItemImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final UserDetails details;

  @override
  String toString() {
    return 'UserItem(email: $email, password: $password, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserItemImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserItemImplCopyWith<_$UserItemImpl> get copyWith =>
      __$$UserItemImplCopyWithImpl<_$UserItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserItemImplToJson(
      this,
    );
  }
}

abstract class _UserItem implements UserItem {
  const factory _UserItem(
      {required final String email,
      required final String password,
      required final UserDetails details}) = _$UserItemImpl;

  factory _UserItem.fromJson(Map<String, dynamic> json) =
      _$UserItemImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  UserDetails get details;
  @override
  @JsonKey(ignore: true)
  _$$UserItemImplCopyWith<_$UserItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  String? get fullName => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get postCount => throw _privateConstructorUsedError;
  String? get followerCount => throw _privateConstructorUsedError;
  String? get followingCount => throw _privateConstructorUsedError;
  List<ImageItem>? get images => throw _privateConstructorUsedError;
  List<VideoItem>? get videos => throw _privateConstructorUsedError;
  List<HighlightItem>? get highlights => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailsCopyWith<UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
          UserDetails value, $Res Function(UserDetails) then) =
      _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call(
      {String? fullName,
      String? userName,
      String? description,
      String? postCount,
      String? followerCount,
      String? followingCount,
      List<ImageItem>? images,
      List<VideoItem>? videos,
      List<HighlightItem>? highlights});
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? userName = freezed,
    Object? description = freezed,
    Object? postCount = freezed,
    Object? followerCount = freezed,
    Object? followingCount = freezed,
    Object? images = freezed,
    Object? videos = freezed,
    Object? highlights = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      postCount: freezed == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageItem>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoItem>?,
      highlights: freezed == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<HighlightItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailsImplCopyWith<$Res>
    implements $UserDetailsCopyWith<$Res> {
  factory _$$UserDetailsImplCopyWith(
          _$UserDetailsImpl value, $Res Function(_$UserDetailsImpl) then) =
      __$$UserDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fullName,
      String? userName,
      String? description,
      String? postCount,
      String? followerCount,
      String? followingCount,
      List<ImageItem>? images,
      List<VideoItem>? videos,
      List<HighlightItem>? highlights});
}

/// @nodoc
class __$$UserDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$UserDetailsImpl>
    implements _$$UserDetailsImplCopyWith<$Res> {
  __$$UserDetailsImplCopyWithImpl(
      _$UserDetailsImpl _value, $Res Function(_$UserDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? userName = freezed,
    Object? description = freezed,
    Object? postCount = freezed,
    Object? followerCount = freezed,
    Object? followingCount = freezed,
    Object? images = freezed,
    Object? videos = freezed,
    Object? highlights = freezed,
  }) {
    return _then(_$UserDetailsImpl(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      postCount: freezed == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageItem>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoItem>?,
      highlights: freezed == highlights
          ? _value._highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<HighlightItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailsImpl implements _UserDetails {
  const _$UserDetailsImpl(
      {this.fullName = '',
      this.userName = '',
      this.description = '',
      this.postCount = '',
      this.followerCount = '',
      this.followingCount = '',
      final List<ImageItem>? images = const [],
      final List<VideoItem>? videos = const [],
      final List<HighlightItem>? highlights = const []})
      : _images = images,
        _videos = videos,
        _highlights = highlights;

  factory _$UserDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsImplFromJson(json);

  @override
  @JsonKey()
  final String? fullName;
  @override
  @JsonKey()
  final String? userName;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final String? postCount;
  @override
  @JsonKey()
  final String? followerCount;
  @override
  @JsonKey()
  final String? followingCount;
  final List<ImageItem>? _images;
  @override
  @JsonKey()
  List<ImageItem>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VideoItem>? _videos;
  @override
  @JsonKey()
  List<VideoItem>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<HighlightItem>? _highlights;
  @override
  @JsonKey()
  List<HighlightItem>? get highlights {
    final value = _highlights;
    if (value == null) return null;
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserDetails(fullName: $fullName, userName: $userName, description: $description, postCount: $postCount, followerCount: $followerCount, followingCount: $followingCount, images: $images, videos: $videos, highlights: $highlights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality()
                .equals(other._highlights, _highlights));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      userName,
      description,
      postCount,
      followerCount,
      followingCount,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_videos),
      const DeepCollectionEquality().hash(_highlights));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      __$$UserDetailsImplCopyWithImpl<_$UserDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsImplToJson(
      this,
    );
  }
}

abstract class _UserDetails implements UserDetails {
  const factory _UserDetails(
      {final String? fullName,
      final String? userName,
      final String? description,
      final String? postCount,
      final String? followerCount,
      final String? followingCount,
      final List<ImageItem>? images,
      final List<VideoItem>? videos,
      final List<HighlightItem>? highlights}) = _$UserDetailsImpl;

  factory _UserDetails.fromJson(Map<String, dynamic> json) =
      _$UserDetailsImpl.fromJson;

  @override
  String? get fullName;
  @override
  String? get userName;
  @override
  String? get description;
  @override
  String? get postCount;
  @override
  String? get followerCount;
  @override
  String? get followingCount;
  @override
  List<ImageItem>? get images;
  @override
  List<VideoItem>? get videos;
  @override
  List<HighlightItem>? get highlights;
  @override
  @JsonKey(ignore: true)
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
