import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/common_pages/post_expanded_page.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/post.dart';
import '../../net/general_network.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _isFavourite = widget.post.liked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: _like, icon: createFavoriteIcon()),
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

  void _openComments() {
    String blogName = '';
    String id = widget.post.globalId.toString();

    if (widget.post.type != PostType.forum) {
      if (widget.post.blogInfo != null) {
        blogName = widget.post.blogInfo!.stringId;
      } else {
        blogName = widget.post.userInfo.blogStringId;
      }

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

  void _like() {
    Request()
        .like(
      widget.post.globalId.toString(),
      widget.post.type == PostType.forum ? 'topic' : 'post',
    )
        .then((value) {
      setState(() {
        _isFavourite = value;
      });
    });
  }
}
