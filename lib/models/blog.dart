import 'dart:convert';

class Blog {
  int id;
  String stringId;
  String title;
  String? musicTitle;
  List? posts;

  Blog(
      {required this.id,
      required this.stringId,
      required this.title,
      required this.musicTitle,
      required this.posts});

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
        id: map['id'] as int,
        stringId: map['name'] as String,
        title: map['title'] as String,
        musicTitle: map['audio'] as String?,
        posts: map['posts'] as List?);
  }

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));
}
