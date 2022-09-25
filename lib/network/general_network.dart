import 'package:flutter_beonfun/ui/post_body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/post.dart';
import '../models/user.dart';

class Request {
  static const token = "563|aW24yKMxYfzSuoMM4EyhJbZgq5x9dX2wqSkL1fF2";

  // Future<void> getToken() async {
  //   var params = {"name": "", "password": "", "device_name": ""};

  //   var response = await http.post(Uri.parse('https://beon.fun/api/v1/token'),
  //       body: params);

  //   print('Response body: ${response.body}');

  //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //   var token = Uri.parse(decodedResponse['token'] as String);

  //   print(await token);
  // }

  Future<User> getUserInfo() async {
    var response = await http.get(Uri.parse('https://beon.fun/api/v1/im'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        });

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    User user = parseUserData(data['self']);

    return user;
  }

  User parseUserData(Map data) {
    return User(
        id: data['id'] as int,
        blogStringId: data['name'] as String,
        name: data['nickname'] as String,
        sign: data['sign'] as String?,
        profileImageUrl: data['profile_image_url'] as String,
        mainAvatarId: data['avatar_id'] == null ? 0 : data['avatar_id'] as int,
        balance: data['positives'] == null ? 0 : data['positives'] as int,
        feedSettings: {"huita": true});
  }

  Future<List<Post>> getPosts() async {
    var response = await http.get(Uri.parse('https://beon.fun/api/v1/feed'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        });

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    List<Post> posts = [];

    for (var d in data) {
      Post post = parsePostData(d);
      posts.add(post);
    }

    return posts;
  }

  Post parsePostData(Map data) {
    if (data['blogpostid'] != null) {
      return DiaryPost(
          inBlogId: data['blogpostid'],
          title: data['title'],
          text: data['text'],
          mood: data['mood'],
          wish: data['wish'],
          music: data['music'],
          avatarId: 0,
          commentsCount: data['comments_count'],
          lastUpdate: data['updated_at'],
          userInfo: parseUserData(data['user']),
          likes: data['liked']);
    }

    return ForumPost(
        title: data['title'],
        text: data['text'],
        avatarId: 0,
        forumId: data['forum_id'],
        commentsCount: data['comments_count'],
        lastUpdate: data['updated_at'],
        userInfo: parseUserData(data['user']),
        likes: data['liked']);
  }

  Future<List<Post>> getDiaryPosts(String blogname) async {
    var blname = blogname;

    var response = await http
        .get(Uri.parse('https://beon.fun/api/v1/blog/$blname'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    });

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var postsData = data['posts'] as List;

    List<Post> posts = [];

    for (var d in postsData) {
      Post post = parsePostData(d);
      posts.add(post);
    }

    return posts;
  }
}