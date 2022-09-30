import 'package:flutter/material.dart';

import '../models/post.dart';
import 'post/post_body.dart';
import 'post/post_footer_view.dart';
import 'post/post_header_view.dart';

class PostListCellView extends StatefulWidget {
  final bool showUserInfo;
  final Post post;
  const PostListCellView(
      {super.key, required this.showUserInfo, required this.post});

  @override
  State<PostListCellView> createState() => _PostListCellViewState();
}

class _PostListCellViewState extends State<PostListCellView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> postParts = [
      PostBody(post: widget.post),
      PostFooterView(post: widget.post)
    ];

    if (widget.showUserInfo) {
      Widget temp = Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: PostHeaderView(
          user: widget.post.userInfo,
          post: widget.post,
        ),
      );

      postParts.insert(0, temp);
    } else {
      postParts.insert(0, const SizedBox(height: 32));
    }

    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: postParts,
    ));
  }
}
