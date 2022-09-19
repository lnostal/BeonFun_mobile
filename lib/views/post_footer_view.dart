import 'package:flutter/material.dart';

class PostFooterView extends StatefulWidget {
  const PostFooterView({super.key});

  @override
  State<PostFooterView> createState() => _PostFooterViewState();
}

class _PostFooterViewState extends State<PostFooterView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.favorite_border, size: 28, color: Colors.grey),
          SizedBox(width: 8),
          Icon(Icons.share, size: 28, color: Colors.grey),
          Spacer(),
          Icon(Icons.forum_outlined, size: 28, color: Colors.grey),
          SizedBox(width: 4),
          Text('12', style: TextStyle(color: Colors.grey, fontSize: 18)),
        ],
      )
    );
  }
}