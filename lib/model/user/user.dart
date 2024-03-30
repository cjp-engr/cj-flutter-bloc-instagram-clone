import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserItem with _$UserItem {
  const factory UserItem({
    required String email,
    required String password,
    required UserDetails details,
  }) = _UserItem;

  factory UserItem.fromJson(Map<String, Object?> json) =>
      _$UserItemFromJson(json);
}

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails({
    @Default('') String? email,
    @Default('') String? fullName,
    @Default('') String? userName,
    @Default('') String? imageUrl,
    @Default('') String? description,
    @Default([]) List<String>? followers,
    @Default([]) List<String>? followings,
    // @Default([]) List<ImageDetails>? images,
    // @Default([]) List<VideoDetails>? videos,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, Object?> json) =>
      _$UserDetailsFromJson(json);
}
