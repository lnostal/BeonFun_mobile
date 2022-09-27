import 'package:flutter/cupertino.dart';

import '../../models/post.dart';

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
        Text(widget.post.text, style: const TextStyle(fontSize: 16))
      ],
    );
  }
}
