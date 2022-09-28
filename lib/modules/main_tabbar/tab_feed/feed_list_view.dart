import 'package:flutter/material.dart';
import 'package:flutter_beonfun/ui/loader.dart';
import 'package:flutter_beonfun/ui/post_body.dart';
import 'package:flutter_beonfun/ui/post_footer_view.dart';
import 'package:flutter_beonfun/ui/post_header_view.dart';

import '../../../models/post.dart';
import '../../../network/general_network.dart';

class FeedListView extends StatefulWidget {
  const FeedListView({super.key});

  @override
  State<FeedListView> createState() => _FeedListViewState();
}

class _FeedListViewState extends State<FeedListView> {
  List<Post> _posts = [];

  void loadData() {
    setState(() {
      _posts = [];
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
    if (_posts.isEmpty) {
      return const Loader();
    }

    return RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: PostHeaderView(
                      user: _posts[index].userInfo,
                      post: _posts[index],
                    ),
                  ),
                  PostBody(
                    post: _posts[index],
                  ),
                  PostFooterView(post: _posts[index])
                ],
              ));
            }));
  }
}
