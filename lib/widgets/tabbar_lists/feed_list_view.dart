import 'package:flutter/material.dart';
import 'package:flutter_beonfun/widgets/posts_list_view.dart';

import '../../../models/post.dart';
import '../../../net/general_network.dart';

class FeedListView extends StatefulWidget {
  const FeedListView({super.key});

  @override
  State<FeedListView> createState() => _FeedListViewState();
}

class _FeedListViewState extends State<FeedListView> {
  List<Post>? _posts;

  void loadData() {
    setState(() {
      _posts = null;
    });

    Request().getPosts().then((List<Post> val) {
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
