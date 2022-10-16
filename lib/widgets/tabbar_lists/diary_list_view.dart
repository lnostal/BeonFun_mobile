import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/post.dart';
import '../../../net/general_network.dart';
import '../posts_list_view.dart';

class DiaryListView extends StatefulWidget {
  const DiaryListView({super.key});

  @override
  State<DiaryListView> createState() => _DiaryListViewState();
}

class _DiaryListViewState extends State<DiaryListView> {
  List<Post>? _posts;

  void loadData() async {
    var prefs = await SharedPreferences.getInstance();
    String? blog = prefs.getString('blogStringId');

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
    setState(() {
      _posts = null;
    });
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
        onFocusGained: loadData,
        child: PostsListView(
          onPullRefresh: _pullRefresh,
          showUserInfo: false,
          posts: _posts,
        ));
  }
}
