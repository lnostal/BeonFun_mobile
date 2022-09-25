import 'package:flutter_beonfun/models/user.dart';

class Post {
  int inBlogId;
  String title;
  String text;
  String mood;
  String wish;
  String music;
  int avatarId;
  int commentsCount;
  String lastUpdate;
  User userInfo;
  List<String> likes;

  Post({
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
