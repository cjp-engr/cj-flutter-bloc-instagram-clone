import 'package:cj_flutter_riverpod_instagram_clone/model/highlight.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/video.dart';

class UserItem {
  final String userId;
  final String email;
  final String fullName;
  final String userName;
  String? description;
  String? postCount;
  String? followerCount;
  String? followingCount;
  List<ImageItem>? images;
  List<VideoItem>? videos;
  List<HighLightItem>? highlights;

  UserItem({
    required this.userId,
    required this.email,
    required this.fullName,
    required this.userName,
    this.description,
    this.postCount,
    this.followerCount,
    this.followingCount,
    this.images,
    this.videos,
    this.highlights,
  });
}
