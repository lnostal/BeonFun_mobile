import 'package:flutter/material.dart';

class PostFooterView extends StatefulWidget {
  const PostFooterView({super.key});

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
            //SizedBox(width: 8),
            IconButton(
                onPressed: _share,
                icon: Icon(Icons.share, size: 28, color: Colors.grey)),
            Spacer(),
            IconButton(
                onPressed: _openComments,
                icon: Icon(Icons.forum_outlined, size: 28, color: Colors.grey)),
            Text('11', style: TextStyle(color: Colors.grey, fontSize: 18)),
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
    print('pretend we opened the commets');
  }

  Icon createFavoriteIcon() {
    if (_isFavourite) {
      return Icon(Icons.favorite, size: 28, color: Colors.brown);
    }

    return Icon(Icons.favorite_border, size: 28, color: Colors.grey);
  }
}
