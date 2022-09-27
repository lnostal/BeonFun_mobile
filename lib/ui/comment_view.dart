import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_beonfun/models/comment.dart';

import '../helpers.dart';
import 'post_header_view.dart';

class CommentView extends StatefulWidget {
  final Comment comment;
  const CommentView({super.key, required this.comment});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PostHeaderView(user: widget.comment.userInfo),
            const SizedBox(height: 0),
            Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16.0),
                child: Text(
                  Helper().removeBBCodeFromString(widget.comment.text),
                  style: const TextStyle(fontSize: 16),
                ))
          ]),
    );
  }
}
