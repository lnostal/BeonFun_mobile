import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_beonfun/net/general_network.dart';
import 'package:flutter_beonfun/widgets/comment_view.dart';

import '../../models/blog.dart';
import '../../models/post.dart';
import '../../widgets/expanded_post/post_expanded.dart';
import '../../widgets/loader_view.dart';

class PostExpandedPage extends StatefulWidget {
  final PostType type;
  final String blname;
  final String id;

  const PostExpandedPage(
      {super.key, required this.type, required this.blname, required this.id});

  @override
  State<PostExpandedPage> createState() => _PostExpandedPageState();
}

class _PostExpandedPageState extends State<PostExpandedPage> {
  var _pushedNewComment = false;

  Map postInfo = {'comments': List};
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_pushedNewComment) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text(setPageTitle(postInfo)),
          border: const Border(bottom: BorderSide(color: Colors.transparent)),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () => Navigator.of(context).pop(),
          )),
      child: SafeArea(
          child:
              createTextField(createView(postInfo)) /*createView(postInfo)*/),
    );
  }

  String setPageTitle(Map postInfo) {
    if (postInfo['blog'] == null && postInfo['post'] == null) {
      return '';
    }

    if (widget.type == PostType.forum) {
      return (postInfo['post'] as Post).forum!.title;
    }

    return (postInfo['blog'] as Blog).title;
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
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            controller: scrollController,
            itemCount: cellsCount,
            itemBuilder: (context, index) {
              if (index == 0) {
                return PostExpanded(post: postInfo['post']);
              }

              return CommentView(comment: postInfo['comments'][index - 1]);
            }));
  }

  Widget createTextField(Widget widget) {
    return Scaffold(
      body: GestureDetector(
        child: widget,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 10,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: sendComment,
                  icon: const Icon(
                    Icons.send,
                  )),
              contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
              hintText: "enter comment...",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(width: 1.5))),
        ),
      ),
    );
  }

  /// - Mark: additional methods

  void sendComment() {
    Request()
        .sendComment(
            widget.blname, widget.id, widget.type, textEditingController.text)
        .then((value) {
      if (value) {
        _pushedNewComment = true;
        textEditingController.clear();
        loadData();
      }

      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  void loadData() {
    Request().getPost(widget.type, widget.blname, widget.id).then((value) {
      setState(() {
        postInfo = value;
      });
    });
  }

  Future<void> _pullRefresh() async {
    _pushedNewComment = false;
    setState(() {
      postInfo = {'post': null, 'comments': List};
    });
    loadData();
  }
}
