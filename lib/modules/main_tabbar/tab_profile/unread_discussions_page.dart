import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/post.dart';
import '../../expanded_post/post_expanded_page.dart';

class UnreadDiscussionsPage extends StatefulWidget {
  List<Post> posts;

  UnreadDiscussionsPage({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  State<UnreadDiscussionsPage> createState() => _UnreadDiscussionsPageState();
}

class _UnreadDiscussionsPageState extends State<UnreadDiscussionsPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Discussions')),
      child: ListView.builder(
          itemCount: widget.posts.length,
          itemBuilder: (context, index) {
            return getDiscussionCell(index);
          }),
    );
  }

  Widget getDiscussionCell(index) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => openExpandedPostPage(widget.posts[index])));
        },
        child: Text(
          widget.posts[index].title,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 16),
        ));
  }

  PostExpandedPage openExpandedPostPage(Post post) {
    String blname = post.type == PostType.forum ? '' : post.blogInfo!.stringId;
    String id = post.type == PostType.forum
        ? post.globalId.toString()
        : post.inPostId.toString();

    return PostExpandedPage(blname: blname, id: id, type: post.type);
  }
}
