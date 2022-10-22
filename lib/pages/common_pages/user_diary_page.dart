import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_beonfun/models/user.dart';

import '../../models/post.dart';
import '../../net/general_network.dart';
import '../../widgets/posts_list_view.dart';

class UserDiaryPage extends StatefulWidget {
  User user;
  UserDiaryPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserDiaryPage> createState() => _UserDiaryPageState();
}

class _UserDiaryPageState extends State<UserDiaryPage> {
  List<Post>? _posts;

  void loadData() {
    setState(() {
      _posts = null;
    });

    Request().getDiaryPosts(widget.user.blogStringId).then((value) {
      setState(() {
        _posts = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> _pullRefresh() async {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(widget.user.blogStringId),
            border: Border(bottom: BorderSide(color: Colors.transparent))),
        child: SafeArea(
            child: PostsListView(
          onPullRefresh: _pullRefresh,
          showUserInfo: true,
          posts: _posts,
        )));
  }
}
