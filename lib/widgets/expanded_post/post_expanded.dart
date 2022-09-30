import 'package:flutter/material.dart';

import '../../../models/post.dart';
import '../avatar_expanded.dart';
import 'post_expanded_body.dart';
import 'post_expanded_header.dart';

class PostExpanded extends StatefulWidget {
  final Post post;
  const PostExpanded({super.key, required this.post});

  @override
  State<PostExpanded> createState() => _PostExpandedState();
}

class _PostExpandedState extends State<PostExpanded> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarExpanded(user: widget.post.userInfo),
                PostExpandedHeader(post: widget.post)
              ]),
          PostExpandedBody(post: widget.post)
        ],
      ),
    ));
  }
}
