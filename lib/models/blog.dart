import 'dart:convert';

import 'package:flutter_beonfun/models/post.dart';

class Blog {
  int id;
  String stringId;
  String title;
  String? musicTitle;
  List? posts;
  PostPrivateSettings? postAccess;
  PostPrivateSettings? commAccess;

  Blog(
      {required this.id,
      required this.stringId,
      required this.title,
      required this.musicTitle,
      required this.posts,
      required this.postAccess,
      required this.commAccess});

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
        id: map['id'] as int,
        stringId: map['name'] as String,
        title: map['title'] as String,
        musicTitle: map['audio'] as String?,
        posts: map['posts'] as List?,
        postAccess: map['postaccess'] != null
            ? setAccessType(map['postaccess'] as String)
            : null,
        commAccess: map['commaccess'] != null
            ? setAccessType(map['commaccess'] as String)
            : null);
  }

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));
}
