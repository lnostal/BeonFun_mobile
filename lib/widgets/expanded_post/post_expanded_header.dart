import 'package:flutter/material.dart';

import '../../../models/post.dart';
import 'post_expanded_actions.dart';

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
                    style: Theme.of(context).textTheme.headlineMedium,
                    overflow: TextOverflow.visible),
                const SizedBox(height: 8),
                Text(widget.post.userInfo.sign ?? '',
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.visible),
                const SizedBox(height: 16),
                PostExpandedActions(post: widget.post)
              ],
            ))));
  }
}
