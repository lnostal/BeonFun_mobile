import 'package:flutter_beonfun/models/user.dart';

class Comment {
  int globalId;
  String text;
  String lastUpdate;
  List likes;
  User userInfo;

  Comment({
    required this.globalId,
    required this.text,
    required this.lastUpdate,
    required this.likes,
    required this.userInfo,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
        globalId: map['id'] as int,
        text: map['text'] as String,
        lastUpdate: map['updated_at'] as String,
        likes: map['liked'],
        userInfo: User.fromMap(map['user']));
  }
}
