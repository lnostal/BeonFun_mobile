import 'package:flutter/material.dart';
import 'package:flutter_beonfun/network/general_network.dart';
import 'package:flutter_beonfun/ui/show_post_view.dart';

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
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: _liked, icon: createFavoriteIcon()),
            // Text(widget.post.likes.length.toString(),
            //     style: const TextStyle(color: Colors.grey, fontSize: 18)),
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
    print('let\'s think that we shared the post');
  }

  void _openComments() {
    if (widget.post.type == PostType.diary) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ShowPost(
              blname: widget.post.userInfo.blogStringId,
              id: (widget.post as DiaryPost).inBlogId.toString())));
    } else {
      print('forum');
    }
  }

  Icon createFavoriteIcon() {
    if (_isFavourite) {
      return Icon(Icons.favorite, size: 28, color: Colors.brown);
    }

    return Icon(Icons.favorite_border, size: 28, color: Colors.grey);
  }
}
