import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/expanded_post/post_expanded_page.dart';

import '../models/post.dart';

class PostFooterView extends StatefulWidget {
  final Post post;

  const PostFooterView({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostFooterView> createState() => _PostFooterViewState();
}

class _PostFooterViewState extends State<PostFooterView> {
  var _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: _liked, icon: createFavoriteIcon()),
            IconButton(
                onPressed: _share,
                icon: const Icon(Icons.share, size: 28, color: Colors.grey)),
            const Spacer(),
            IconButton(
                onPressed: _openComments,
                icon: const Icon(Icons.forum_outlined,
                    size: 28, color: Colors.grey)),
            Text(widget.post.commentsCount.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 18)),
          ],
        ));
  }

  void _liked() {
    _isFavourite = !_isFavourite;

    setState(() {});
  }

  void _share() {
    debugPrint('let\'s think that we shared the post');
  }

  void _openComments() {
    String blogName = '';
    String id = widget.post.globalId.toString();

    if (widget.post.type != PostType.forum) {
      blogName = widget.post.blogInfo!.stringId;
      id = widget.post.inPostId.toString();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PostExpandedPage(
            type: widget.post.type, blname: blogName, id: id)));
  }

  Icon createFavoriteIcon() {
    if (_isFavourite) {
      return const Icon(Icons.favorite, size: 28, color: Colors.brown);
    }

    return const Icon(Icons.favorite_border, size: 28, color: Colors.grey);
  }
}
