import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/expanded_post/ui/post_expanded.dart';
import 'package:flutter_beonfun/network/general_network.dart';
import 'package:flutter_beonfun/ui/comment_view.dart';

import '../../models/blog.dart';
import '../../ui/loader.dart';

class PostExpandedPage extends StatefulWidget {
  final String blname;
  final String id;

  const PostExpandedPage({super.key, required this.blname, required this.id});

  @override
  State<PostExpandedPage> createState() => _PostExpandedPageState();
}

class _PostExpandedPageState extends State<PostExpandedPage> {
  Map postInfo = {'post': null, 'comments': List};

  @override
  void initState() {
    super.initState();
    Request().getPost(widget.blname, widget.id).then((value) {
      setState(() {
        postInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(setPageTitle(postInfo)),
            backgroundColor: CupertinoColors.white,
            leading: CupertinoNavigationBarBackButton(
              color: Colors.brown,
              onPressed: () => Navigator.of(context).pop(),
            )),
        child: SafeArea(child: createView(postInfo)));
  }

  String setPageTitle(Map postInfo) {
    if (postInfo['blog'] != null) {
      return (postInfo['blog'] as Blog).title;
    }

    return '';
  }

  Future<void> _pullRefresh() async {
    setState(() {
      postInfo = {'post': null, 'comments': List};
    });

    Request().getPost(widget.blname, widget.id).then((value) {
      setState(() {
        postInfo = value;
      });
    });
  }

  Widget createView(Map postInfo) {
    if (postInfo['post'] == null) {
      return const Loader();
    }

    int cellsCount = 1;

    if (postInfo['comments'] != null) {
      cellsCount = (postInfo['comments'] as List).length + 1;
    }

    return RefreshIndicator(
        onRefresh: _pullRefresh,
        color: Colors.brown,
        child: ListView.builder(
            itemCount: cellsCount,
            itemBuilder: (context, index) {
              if (index == 0) {
                return PostExpanded(post: postInfo['post']);
              }

              return CommentView(comment: postInfo['comments'][index - 1]);
            }));
  }
}

void foo() {}
