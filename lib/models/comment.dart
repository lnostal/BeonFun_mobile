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
}
