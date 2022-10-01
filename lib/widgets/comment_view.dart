import 'package:flutter/material.dart';
import 'package:flutter_bbcode/flutter_bbcode.dart';
import 'package:flutter_beonfun/models/comment.dart';

import '../utils/string_parser.dart';
import 'post/post_header_view.dart';

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
                child: BBCodeText(
                  selectable: true,
                  data: StringParser().toRenderedString(widget.comment.text),
                  defaultStyle: Theme.of(context).textTheme.bodyMedium,
                ))
          ]),
    );
  }
}
