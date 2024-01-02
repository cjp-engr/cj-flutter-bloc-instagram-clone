import 'package:cj_flutter_riverpod_instagram_clone/model/highlight/highlight_item.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_item.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/video/video_item.dart';
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
    @Default('') String? fullName,
    @Default('') String? userName,
    @Default('') String? description,
    @Default('') String? postCount,
    @Default('') String? followerCount,
    @Default('') String? followingCount,
    @Default([]) List<ImageItem>? images,
    @Default([]) List<VideoItem>? videos,
    @Default([]) List<HighlightItem>? highlights,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, Object?> json) =>
      _$UserDetailsFromJson(json);
}
