import 'package:flutter/material.dart';
import 'package:flutter_beonfun/ui/post_body.dart';
import 'package:flutter_beonfun/ui/post_footer_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/post.dart';
import '../../../network/general_network.dart';
import '../../../ui/loader.dart';

class DiaryListView extends StatefulWidget {
  const DiaryListView({super.key});

  @override
  State<DiaryListView> createState() => _DiaryListViewState();
}

class _DiaryListViewState extends State<DiaryListView> {
  List<Post> _posts = [];

  void loadData() async {
    setState(() {
      _posts = [];
    });

    var prefs = await SharedPreferences.getInstance();
    String? blog = prefs.getString('blogStringId');

    if (blog == null) {
      setState(() {
        _posts = [];
      });
    }
    Request().getDiaryPosts(blog!).then((List<Post> val) {
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
                    const SizedBox(height: 32),
                    PostBody(post: _posts[index]),
                    PostFooterView(post: _posts[index])
                  ]));
            }));
  }
}
