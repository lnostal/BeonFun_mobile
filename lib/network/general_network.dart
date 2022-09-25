import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

class Request {
  Future<void> getToken() async {
    var params = {"name": "", "password": "", "device_name": ""};

    var response = await http.post(Uri.parse('https://beon.fun/api/v1/token'),
        body: params);

    print('Response body: ${response.body}');

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var token = Uri.parse(decodedResponse['token'] as String);

    print(await token);
  }

  Future<User> getUserInfo() async {
    const token = "562|dTmBxPpdf6vM66HmuqYypo3FtHXZQobvczAx7gVe";

    var response = await http.post(Uri.parse('https://beon.fun/api/v1/im'),
        headers: {'Authorization': 'Bearer $token'});

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    User user = User(
        id: data['self']['id'] as int,
        blogStringId: data['self']['name'] as String,
        name: data['self']['nickname'] as String,
        sign: data['self']['sign'] as String,
        profileImageUrl: data['self']['profile_image_url'] as String,
        mainAvatarId: data['self']['avatar_id'] as int,
        balance: data['self']['positives'] as int,
        feedSettings: {
          "hide_community": data['self']['hide_community'] as bool,
          "hide_forum": data['self']['hide_forum'] as bool,
          "hide_repost": data['self']['hide_repost'] as bool,
          "hide_test": data['self']['hide_test'] as bool,
          "feeddiz": data['self']['feeddiz'] as bool,
        });

    return user;
  }
}
