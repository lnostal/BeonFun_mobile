import 'dart:ui';

import 'package:flutter_beonfun/models/user.dart';

class Message {
  int globalId;
  String text;
  bool isRead;
  String lastUpdate;
  User from;
  User to;
  Message({
    required this.globalId,
    required this.text,
    required this.isRead,
    required this.lastUpdate,
    required this.from,
    required this.to,
  });
}
