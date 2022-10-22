import 'package:flutter/material.dart';
import 'package:flutter_beonfun/net/general_network.dart';
import 'package:share_plus/share_plus.dart';

import '../../../models/post.dart';

class PostExpandedActions extends StatefulWidget {
  final Post post;

  const PostExpandedActions({super.key, required this.post});

  @override
  State<PostExpandedActions> createState() => _PostExpandedActionsState();
}

class _PostExpandedActionsState extends State<PostExpandedActions> {
  bool liked = false;

  @override
  void initState() {
    super.initState();
    liked = liked = widget.post.liked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        IconButton(onPressed: _like, icon: createFavoriteIcon()),
        IconButton(onPressed: _share, icon: const Icon(Icons.share)),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.forum_outlined),
        ),
        Text(widget.post.commentsCount.toString(),
            style: TextStyle(
                color: Theme.of(context).textTheme.headlineSmall?.color,
                fontSize: 18))
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
  }

  Icon createFavoriteIcon() {
    if (liked) {
      return Icon(Icons.favorite,
          size: 28, color: Theme.of(context).primaryColor);
    }

    return const Icon(Icons.favorite_border);
  }

  void _like() {
    Request()
        .like(
      widget.post.globalId.toString(),
      widget.post.type == PostType.forum ? 'topic' : 'post',
    )
        .then((value) {
      setState(() {
        liked = value;
      });
    });
  }
}
