import 'package:flutter/material.dart';
import 'package:flutter_beonfun/helpers.dart';

import '../models/post.dart';

class PostBody extends StatefulWidget {
  final Post post;

  const PostBody({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Helper().removeBBCodeFromString(widget.post.text),
                style: const TextStyle(fontSize: 16))
          ],
        ));
  }
}
