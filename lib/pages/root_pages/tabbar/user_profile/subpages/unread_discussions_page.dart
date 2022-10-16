// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/widgets/loader_view.dart';

import '../../../../../models/post.dart';
import '../../../../../net/general_network.dart';
import '../../../../common_pages/post_expanded_page.dart';

class UnreadDiscussionsPage extends StatefulWidget {
  // List<Post> posts;

  UnreadDiscussionsPage({
    Key? key,
    //required this.posts,
  }) : super(key: key);

  @override
  State<UnreadDiscussionsPage> createState() => _UnreadDiscussionsPageState();
}

class _UnreadDiscussionsPageState extends State<UnreadDiscussionsPage> {
  List<Post>? posts;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    Request().getDiscussions().then((value) {
      setState(() {
        posts = value.where((element) => element.unread == true).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text('Уведомления'),
          border: Border(bottom: BorderSide(color: Colors.transparent))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: createBody(),
      ),
    );
  }

  Widget createBody() {
    if (posts == null) {
      return Loader();
    }

    if (posts!.isEmpty) {
      return Center(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Нет новых уведомлений',
                style: Theme.of(context).textTheme.bodyMedium,
              )));
    }

    return ListView.builder(
        itemCount: posts!.length,
        itemBuilder: (context, index) {
          return getDiscussionCell(index);
        });
  }

  Widget getDiscussionCell(index) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => openExpandedPostPage(posts![index])));
          },
          child: Text(
            posts![index].title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 16),
          )),
    );
  }

  PostExpandedPage openExpandedPostPage(Post post) {
    String blname = post.type == PostType.forum ? '' : post.blogInfo!.stringId;
    String id = post.type == PostType.forum
        ? post.globalId.toString()
        : post.inPostId.toString();

    return PostExpandedPage(blname: blname, id: id, type: post.type);
  }
}
