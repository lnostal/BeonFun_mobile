import 'package:flutter_beonfun/models/user.dart';

class Message {
  int globalId;
  String text;
  bool isRead;
  String lastUpdate;
  User from;
  User? to;
  Message({
    required this.globalId,
    required this.text,
    required this.isRead,
    required this.lastUpdate,
    required this.from,
    required this.to,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
        globalId: map['id'] as int,
        text: map['message'] as String,
        isRead: (map['is_read'] as int) == 0,
        lastUpdate: map['updated_at'] as String,
        from: User.fromMap(map['user']),
        to: map['recipient'] != null ? User.fromMap(map['recipient']) : null);
  }
}
