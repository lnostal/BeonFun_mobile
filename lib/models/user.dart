//import 'dart:html';

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
}
