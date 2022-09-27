// ignore_for_file: overridden_fields

import 'package:flutter_beonfun/models/user.dart';

class Post {
  PostType type = PostType.diary;
  late String title;
  late String text;
  late int avatarId;
  late int commentsCount;
  late String lastUpdate;
  late User userInfo;
  late List likes;
}

enum PostType { diary, forum, community }

class DiaryPost extends Post {
  int inBlogId;
  @override
  String title;
  @override
  String text;
  String? mood;
  String? wish;
  String? music;

  @override
  int avatarId;

  @override
  int commentsCount;

  @override
  String lastUpdate;
  @override
  User userInfo;

  @override
  List likes;

  @override
  PostType type = PostType.diary;

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
  @override
  String title;

  @override
  String text;

  @override
  int avatarId;
  int forumId;

  @override
  int commentsCount;

  @override
  String lastUpdate;

  @override
  User userInfo;

  @override
  List likes;

  @override
  PostType type = PostType.forum;

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
