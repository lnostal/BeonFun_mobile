import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/blog.dart';
import '../models/comment.dart';
import '../models/message.dart';
import '../models/post.dart';
import '../models/user.dart';

class Request {
  static const _endpoint = 'https://beon.fun/api/v1';

  /// Load info about user
  ///
  Future<User> getUserInfo() async {
    var response =
        await http.get(Uri.parse('$_endpoint/im'), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    User user = User.fromMap(data['self']);

    var prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', user.id.toString());
    prefs.setString('blogStringId', user.blogStringId);

    return user;
  }

  /// Load posts of general feed
  ///
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

  /// Load friend's posts
  ///
  Future<List<Post>> getFriendsPosts() async {
    var response = await http.get(Uri.parse('$_endpoint/friends/posts'),
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

  /// Load posts of discussions
  ///
  Future<List<Post>> getDiscussions() async {
    var response = await http.get(Uri.parse('$_endpoint/discussions'),
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

  /// Load posts of specific blog by [blogname]
  ///
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

  /// Open post based on [type]
  ///
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

  /// Send comments based on [type]
  ///
  /// If type is 'forum', send general [postId]
  /// If not, send [postId] of blog
  ///
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

  /// Create new post in diary
  ///
  Future<bool> createPost(String blname, String title, String message) async {
    String rout = '$_endpoint/blog/$blname/new';

    var response = await http.post(Uri.parse(rout),
        headers: await getHeaders(),
        body: jsonEncode(<String, String>{
          'text': message,
          'title': title,
          'access': 'users'
        }));

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

  /// Check if token expired
  ///
  Future<bool> tokenExpired() async {
    var prefs = await SharedPreferences.getInstance();
    bool tokenExists = prefs.getString('token') != null;

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

  /// Sign in
  ///
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

  /// Logout
  ///
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
    }
  }

  /// Like the content
  ///
  Future<bool> like(String globalId, String contentType) async {
    var response = await http.post(Uri.parse('$_endpoint/misc/like'),
        headers: await getHeaders(),
        body: jsonEncode(<String, String>{
          'id': globalId,
          'type': contentType,
        }));

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    String type = data['type'] as String;

    if (type == 'like') {
      return true;
    }
    return false;
  }

  /// Upload images
  /// ...
  Future<void> uploadImages(
      List<XFile> images, Function(List str) onComplite) async {
    String rout = '$_endpoint/upload/images';

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? 0;

    var request = http.MultipartRequest('POST', Uri.parse(rout));
    request.headers.addAll({'Authorization': 'Bearer $token'});

    for (var element in images) {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    }

    var response = await request.send();

    http.Response.fromStream(response).then((response) {
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

      if (response.statusCode == 200 && data['status'] == 'ok') {
        onComplite(data['fileurls'] as List);
      }
    });
  }

  /// Get chats
  ///
  Future<List<Message>> getChats() async {
    var response =
        await http.get(Uri.parse('$_endpoint/im'), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var chats = data['messages'] as List;

    List<Message> dialogs = [];

    for (var chat in chats) {
      Message dialog = Message.fromMap(chat);
      dialogs.add(dialog);
    }

    return dialogs;
  }

  /// Get chat history
  ///
  Future<List<Message>> getChatHistory(String blname) async {
    var response = await http.get(Uri.parse('$_endpoint/im/$blname'),
        headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var messages = data['messages'] as List;

    List<Message> dialogs = [];

    for (var message in messages) {
      Message dialog = Message.fromMap(message);
      dialogs.add(dialog);
    }

    return dialogs;
  }

  /// Send message to chat
  ///
  Future<bool> sendMessage(String blname, String text) async {
    var response = await http.post(Uri.parse('$_endpoint/im/$blname'),
        headers: await getHeaders(),
        body: jsonEncode(<String, String>{'message': text}));

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

  Future<bool> checkNewMessages(String blname, String index) async {
    var rout = '$_endpoint/im/$blname/check?last=$index';

    var response = await http.get(Uri.parse(rout), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (data['new'] as String == '1') {
      return true;
    }

    return false;
  }

  Future<List<Message>> getNewMessages(String blname, String index) async {
    var rout = '$_endpoint/im/$blname/get?last=$index';

    var response = await http.get(Uri.parse(rout), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    List<Message> messages = [];

    for (var msg in data) {
      messages.add(Message.fromMap(msg));
    }

    return messages;
  }

  Future<Map> getNotifications() async {
    var response = await http.get(Uri.parse('$_endpoint/notifications'),
        headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var messages = data['messages'] as int;
    var discussions = data['discussions'] as int;
    var chats = data['chats'] as int;

    return {'messages': messages, 'discussions': discussions, 'chats': chats};
  }

  Future<bool> checkNewComments(
      String blname, String id, String index, PostType type) async {
    var rout = type == PostType.forum
        ? '$_endpoint/topic/$id/check?last=$index'
        : '$_endpoint/blog/$blname/post/$id/check?last=$index';

    var response = await http.get(Uri.parse(rout), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (data['new'] as int == 1) {
      return true;
    }

    return false;
  }

  Future<List<Comment>> getNewComments(
      String blname, String id, String index, PostType type) async {
    var rout = type == PostType.forum
        ? '$_endpoint/topic/$id/get?last=$index'
        : '$_endpoint/blog/$blname/post/$id/get?last=$index';

    var response = await http.get(Uri.parse(rout), headers: await getHeaders());

    if (response.statusCode != 200) {
      var code = response.statusCode;
      throw Exception('Faild request with code $code');
    }

    var data = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    List<Comment> comments = [];

    for (var comm in data) {
      comments.add(Comment.fromMap(comm));
    }

    return comments;
  }

  /// ---------------------------------------------------
  /// Get headers based on token
  ///
  Future<Map<String, String>> getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? 0;

    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }
}
