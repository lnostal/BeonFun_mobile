// ignore_for_file: overridden_fields

import 'package:flutter/foundation.dart';
import 'package:flutter_beonfun/models/forum.dart';
import 'package:flutter_beonfun/models/user.dart';

import 'blog.dart';

class Post {
  int? inPostId;
  int globalId;
  PostType type;
  String title;
  String text;
  String? mood;
  String? wish;
  String? music;
  Forum? forum;
  int commentsCount;
  String lastUpdate;
  User userInfo;
  Blog? blogInfo;
  bool liked;
  bool? unread;
  PostPrivateSettings? postAccess;
  bool? canComment;

  Post(
      {required this.type,
      this.inPostId,
      required this.globalId,
      required this.title,
      required this.text,
      this.mood,
      this.wish,
      this.music,
      this.forum,
      required this.commentsCount,
      required this.lastUpdate,
      required this.userInfo,
      this.blogInfo,
      required this.liked,
      this.unread,
      this.postAccess,
      this.canComment});

  factory Post.fromMap(Map<String, dynamic> map) {
    PostType type = PostType.diary;

    if (map['forum'] != null) {
      type = PostType.forum;
    }

    User userInfo = User.fromMap(map['user']);

    if (map['blog'] != null) {
      Blog? blogInfo = Blog.fromMap(map['blog']);

      if (userInfo.blogStringId != blogInfo.stringId) {
        type = PostType.community;
      }
    }

    bool? statusNew = false;
    if (map['pivot'] != null) {
      int status = (map['pivot'] as Map)['status'] as int;
      statusNew = status == 0;
    } else {
      statusNew = null;
    }

    bool liked =
        (map['liked'] != null) ? (map['liked'] as List).isNotEmpty : false;

    return Post(
        type: type,
        globalId: map['id'] as int,
        inPostId: map['blogpostid'] as int?,
        title: map['title'] as String,
        text: map['text'] as String,
        mood: map['mood'] as String?,
        wish: map['wish'] as String?,
        music: map['music'] as String?,
        forum: type == PostType.forum ? Forum.fromMap(map['forum']) : null,
        commentsCount: map['comments_count'] as int,
        lastUpdate: map['updated_at'] as String,
        userInfo: userInfo,
        blogInfo: (map['blog'] != null) ? Blog.fromMap(map['blog']) : null,
        liked: liked,
        unread: statusNew,
        postAccess: map['access'] != null
            ? setAccessType(map['access'] as String)
            : null,
        canComment:
            map['can_comment'] != null ? map['can_comment'] as bool : null);
  }
}

enum PostType {
  diary,
  forum,
  community,
}

enum PostPrivateSettings { all, friends, users, me }

PostPrivateSettings setAccessType(String str) {
  PostPrivateSettings type = PostPrivateSettings.values
      .firstWhere((value) => describeEnum(value) == str);

  return type;
}
