import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/blog.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

class Request {
  static const _endpoint = 'https://beon.fun/api/v1';

  Future<User> getUserInfo() async {
    var response =
        await http.get(Uri.parse('$_endpoint/im'), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    User user = User.fromMap(data['self']);

    return user;
  }

  Future<List<Post>> getPosts() async {
    var response = await http.get(Uri.parse('$_endpoint/feed'),
        headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    List<Post> posts = [];

    for (var d in data) {
      Post post = Post.fromMap(d);
      posts.add(post);
    }

    return posts;
  }

  Future<List<Post>> getDiaryPosts(String blogname) async {
    var blname = blogname;

    var response = await http.get(Uri.parse('$_endpoint/blog/$blname'),
        headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var postsData = data['posts'] as List;

    List<Post> posts = [];

    for (var d in postsData) {
      Post post = Post.fromMap(d);
      posts.add(post);
    }

    return posts;
  }

  Future<Map> getPost(PostType type, String blname, String postId) async {
    String rout = type == PostType.forum
        ? '$_endpoint/topic/$postId'
        : '$_endpoint/blog/$blname/post/$postId';

    var response = await http.get(Uri.parse(rout), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    Post postInfo = type == PostType.forum
        ? Post.fromMap(data['topic'])
        : Post.fromMap(data['post']);

    Blog? blogInfo = type == PostType.forum ? null : Blog.fromMap(data['blog']);

    var commentsData = type == PostType.forum
        ? data['replies'] as List
        : data['comments'] as List;
    List<Comment> comments = [];

    for (var comm in commentsData) {
      Comment comment = Comment.fromMap(comm);
      comments.add(comment);
    }

    return {'blog': blogInfo, 'post': postInfo, 'comments': comments};
  }

  Future<bool> sendComment(
      String blname, String postId, PostType type, String message) async {
    String rout = type == PostType.forum
        ? '$_endpoint/topic/$postId'
        : '$_endpoint/blog/$blname/post/$postId';

    var response = await http.post(Uri.parse(rout),
        headers: await getHeaders(),
        body: jsonEncode(<String, String>{'message': message}));

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (data['status'] as String == 'ok') {
      return true;
    }

    return false;
  }

  Future<bool> tokenExpired() async {
    var prefs = await SharedPreferences.getInstance();
    bool tokenExists = await prefs.getString('token') != null;

    if (!tokenExists) {
      return true;
    }

    var response = await http.get(Uri.parse('$_endpoint/test'),
        headers: await getHeaders());

    if (response.statusCode != 200) {
      return true;
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    User user = User.fromMap(data);

    await prefs.setString('userId', user.id.toString());
    await prefs.setString('blogStringId', user.blogStringId);

    return false;
  }

  Future<String> login(String login, String pass) async {
    String rout = '$_endpoint/token';

    var response = await http.post(Uri.parse(rout),
        body: {'name': login, 'password': pass, 'device_name': 'flatter app'});

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    return data['token'] as String;
  }

  Future<Map<String, String>> getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? 0;

    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }

  Future<void> logout() async {
    String rout = '$_endpoint/logout';

    var response = await http.get(Uri.parse(rout), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (data['status'] as String == 'ok') {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      //final token = prefs.getString('token') ?? 0;
    }
  }
}
