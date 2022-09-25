import 'package:flutter_beonfun/models/user.dart';

class Post {}

enum PostType { diary, forum, community }

class DiaryPost extends Post {
  PostType type = PostType.diary;
  int inBlogId;
  String title;
  String text;
  String? mood;
  String? wish;
  String? music;
  int avatarId;
  int commentsCount;
  String lastUpdate;
  User userInfo;
  List likes;

  DiaryPost({
    required this.inBlogId,
    required this.title,
    required this.text,
    required this.mood,
    required this.wish,
    required this.music,
    required this.avatarId,
    required this.commentsCount,
    required this.lastUpdate,
    required this.userInfo,
    required this.likes,
  });
}

class ForumPost extends Post {
  PostType type = PostType.forum;
  String title;
  String text;
  int avatarId;
  int forumId;
  int commentsCount;
  String lastUpdate;
  User userInfo;
  List likes;

  ForumPost({
    required this.title,
    required this.text,
    required this.avatarId,
    required this.forumId,
    required this.commentsCount,
    required this.lastUpdate,
    required this.userInfo,
    required this.likes,
  });
}
