import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/blog.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

class Request {
  static const token = "563|aW24yKMxYfzSuoMM4EyhJbZgq5x9dX2wqSkL1fF2";
  static const headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json'
  };

  Future<User> getUserInfo() async {
    var response = await http.get(Uri.parse('https://beon.fun/api/v1/im'),
        headers: headers);

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    User user = User.fromMap(data['self']);

    return user;
  }

  Future<List<Post>> getPosts() async {
    var response = await http.get(Uri.parse('https://beon.fun/api/v1/feed'),
        headers: headers);

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

    var response = await http.get(
        Uri.parse('https://beon.fun/api/v1/blog/$blname'),
        headers: headers);

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

  Future<Map> getPost(String blname, String postId) async {
    var response = await http.get(
        Uri.parse('https://beon.fun/api/v1/blog/$blname/post/$postId'),
        headers: headers);

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    Post postInfo = Post.fromMap(data['post']);
    Blog blogInfo = Blog.fromMap(data['blog']);

    var commentsData = data['comments'] as List;
    List<Comment> comments = [];

    for (var comm in commentsData) {
      Comment comment = Comment.fromMap(comm);
      comments.add(comment);
    }

    return {'blog': blogInfo, 'post': postInfo, 'comments': comments};
  }
}
