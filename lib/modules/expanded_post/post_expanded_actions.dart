import 'package:flutter/material.dart';

import '../../models/post.dart';

class PostExpandedActions extends StatefulWidget {
  final Post post;
  const PostExpandedActions({super.key, required this.post});

  @override
  State<PostExpandedActions> createState() => _PostExpandedActionsState();
}

class _PostExpandedActionsState extends State<PostExpandedActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border,
                size: 28, color: Colors.grey)),
        Text(widget.post.likes.length.toString(),
            style: const TextStyle(color: Colors.grey, fontSize: 18)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, size: 28, color: Colors.grey)),
        IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.forum_outlined, size: 28, color: Colors.grey)),
        Text(widget.post.commentsCount.toString(),
            style: const TextStyle(color: Colors.grey, fontSize: 18))
      ],
    );
  }
}
