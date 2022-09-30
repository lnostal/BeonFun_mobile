import 'package:flutter/material.dart';
import 'package:flutter_beonfun/widgets/posts_list_view.dart';

import '../../../models/post.dart';
import '../../../net/general_network.dart';

class FriendListView extends StatefulWidget {
  const FriendListView({super.key});

  @override
  State<FriendListView> createState() => _FriendListViewState();
}

class _FriendListViewState extends State<FriendListView> {
  List<Post>? _posts;

  void loadData() {
    setState(() {
      _posts = null;
    });

    Request().getFriendsPosts().then((List<Post> val) {
      setState(() {
        _posts = val;
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
    return PostsListView(
      onPullRefresh: _pullRefresh,
      showUserInfo: true,
      posts: _posts,
    );
  }
}
