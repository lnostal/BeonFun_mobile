import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/expanded_post/post_expanded_actions.dart';

import '../../models/post.dart';

class PostExpandedHeader extends StatefulWidget {
  final Post post;
  const PostExpandedHeader({super.key, required this.post});

  @override
  State<PostExpandedHeader> createState() => _PostExpandedHeaderState();
}

class _PostExpandedHeaderState extends State<PostExpandedHeader> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: (Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.post.userInfo.name,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    overflow: TextOverflow.visible),
                const SizedBox(height: 8),
                Text(widget.post.userInfo.sign ?? '',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    overflow: TextOverflow.visible),
                const SizedBox(height: 16),
                PostExpandedActions(post: widget.post)
              ],
            ))));
  }
}
