import 'package:flutter_beonfun/models/post.dart';

class Blog {
  int id;
  String stringId;
  String title;
  String? musicTitle;
  List<DiaryPost>? posts;

  Blog(
      {required this.id,
      required this.stringId,
      required this.title,
      required this.musicTitle});
}
