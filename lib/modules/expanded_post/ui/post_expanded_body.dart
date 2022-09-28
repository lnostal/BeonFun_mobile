import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bbcode/flutter_bbcode.dart';
import 'package:flutter_bbcode/tags/tag_parser.dart';
import 'package:flutter_beonfun/helpers.dart';

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
    // Widget parsedBBCode = BBCodeText(
    //     errorBuilder: (context, error, stack) {
    //       return Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const Text("Failed to parse BBCode correctly.",
    //               style: TextStyle(color: Colors.red)),
    //           const Text(
    //               "This usually means on of the tags is not properly handling unexpected input.\n"),
    //           Text(error.toString()),
    //         ],
    //       );
    //     },
    //     data: widget.post.text.toLowerCase());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(widget.post.title, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 16),
        BBCodeText(
          selectable: true,
          data: Helper().toRenderedString(widget.post.text),
          defaultStyle: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}
