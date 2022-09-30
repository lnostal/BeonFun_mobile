import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../models/post.dart';

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
            onPressed: _share,
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

  void _share() {
    String urlToShare;

    if (widget.post.type == PostType.forum) {
      urlToShare = 'https://beon.fun/discussion/${widget.post.globalId}';
    } else if (widget.post.type == PostType.diary) {
      urlToShare =
          'https://${widget.post.userInfo.blogStringId}.beon.fun/${widget.post.inPostId}';
    } else {
      urlToShare =
          'https://${widget.post.blogInfo!.stringId}.beon.fun/${widget.post.inPostId}';
    }

    String fullShareText =
        '"${widget.post.title}"\n$urlToShare\n\nОтправлено через прилогу с любовью и обожанием';

    Share.share(fullShareText, subject: widget.post.title);

    debugPrint('let\'s think that we shared the post');
  }
}
