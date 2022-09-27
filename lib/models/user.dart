//import 'dart:html';

import 'package:flutter_beonfun/models/avatar.dart';

class User {
  int id;
  String blogStringId;
  String name;
  String? sign;
  String profileImageUrl;
  String? currentAvatar;
  int balance;
  Map<String, bool> feedSettings; //настройки отображения главной страницы

  User({
    required this.id,
    required this.blogStringId,
    required this.name,
    required this.sign,
    required this.profileImageUrl,
    required this.currentAvatar,
    required this.balance,
    required this.feedSettings,
  });

  factory User.fromMap(Map data) {
    String profileAvatar = data['profile_image_url'] as String;

    return User(
        id: data['id'] as int,
        blogStringId: data['name'] as String,
        name: data['nickname'] as String,
        sign: data['sign'] as String?,
        profileImageUrl: 'https:$profileAvatar',
        currentAvatar: data['avatar'] != null
            ? Avatar.fromMap(data['avatar']).url(data['path'] as String)
            : null,
        balance: data['positives'] == null ? 0 : data['positives'] as int,
        feedSettings: {"huita": true});
  }
}
