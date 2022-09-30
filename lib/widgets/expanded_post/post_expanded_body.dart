import 'package:flutter/material.dart';
import 'package:flutter_bbcode/flutter_bbcode.dart';
import 'package:flutter_beonfun/utils/string_parser.dart';

import '../../../models/post.dart';

class PostExpandedBody extends StatefulWidget {
  final Post post;
  const PostExpandedBody({super.key, required this.post});

  @override
  State<PostExpandedBody> createState() => _PostExpandedBodyState();
}

class _PostExpandedBodyState extends State<PostExpandedBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(widget.post.title, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 16),
        BBCodeText(
          selectable: true,
          data: StringParser().toRenderedString(widget.post.text),
          defaultStyle: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}
