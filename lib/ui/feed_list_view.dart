import 'package:flutter/material.dart';
import 'package:flutter_beonfun/ui/post_body.dart';
import 'package:flutter_beonfun/ui/post_footer_view.dart';
import 'package:flutter_beonfun/ui/post_header_view.dart';

import '../models/post.dart';
import '../network/general_network.dart';

class FeedListView extends StatefulWidget {
  const FeedListView({super.key});

  @override
  State<FeedListView> createState() => _FeedListViewState();
}

class _FeedListViewState extends State<FeedListView> {
  List<Post> _posts = [];

  void loadData() {
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostHeaderView(user: _posts[index].userInfo),
              PostBody(
                post: _posts[index],
              ),
              PostFooterView(post: _posts[index])
            ],
          ));
        });
  }
}