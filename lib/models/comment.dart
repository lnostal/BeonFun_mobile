import 'package:flutter_beonfun/models/user.dart';

class Comment {
  int globalId;
  String text;
  String lastUpdate;
  //int avatarId;
  List<String> likes;
  User userInfo;

  Comment({
    required this.globalId,
    required this.text,
    required this.lastUpdate,
    //required this.avatarId,
    required this.likes,
    required this.userInfo,
  });
}
