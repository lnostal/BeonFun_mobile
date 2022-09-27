import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_beonfun/helpers.dart';
import 'package:flutter_beonfun/models/comment.dart';
import 'package:flutter_beonfun/models/post.dart';
import 'package:flutter_beonfun/network/general_network.dart';
import 'package:flutter_beonfun/ui/post_body.dart';
import 'package:flutter_beonfun/ui/post_header_view.dart';

import '../models/blog.dart';

class ShowPost extends StatefulWidget {
  final String blname;
  final String id;

  const ShowPost({super.key, required this.blname, required this.id});

  @override
  State<ShowPost> createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  Map postInfo = {'post': null, 'comments': List};

  @override
  void initState() {
    super.initState();
    Request().getPost(widget.blname, widget.id).then((value) {
      setState(() {
        postInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(setPageTitle(postInfo)),
            backgroundColor: CupertinoColors.white,
            leading: CupertinoNavigationBarBackButton(
              color: Colors.brown,
              onPressed: () => Navigator.of(context).pop(),
            )),
        child: SafeArea(child: createPost(postInfo)));
  }

  String setPageTitle(Map postInfo) {
    if (postInfo['blog'] != null) {
      return (postInfo['blog'] as Blog).title;
    }

    return '';
  }

  Widget post(Map postInfo) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [setAvatar(postInfo), setUserInfo(postInfo)]),
          setPostBody(postInfo)
        ],
      ),
    ));
  }

  ClipRRect setAvatar(Map postInfo) {
    String avatarUrl = 'https://base.io';

    if (postInfo['post'] != null) {
      avatarUrl = (postInfo['post'] as Post).userInfo.currentAvatar as String;
    }

    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: FadeInImage(
            placeholder:
                const AssetImage('assets/images/avatar_placeholder.png'),
            image: NetworkImage(avatarUrl)));
  }

  Widget setUserInfo(Map postInfo) {
    String name = '';
    String sign = '';

    if (postInfo['post'] != null) {
      Post post = postInfo['post'] as DiaryPost;
      name = post.userInfo.name;
      sign = post.userInfo.sign ?? '';
    }

    return Flexible(
        child: (Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    overflow: TextOverflow.visible),
                SizedBox(height: 8),
                Text(sign,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    overflow: TextOverflow.visible),
                SizedBox(height: 16),
                setActionButtons(postInfo)
              ],
            ))));
  }

  Row setActionButtons(Map postInfo) {
    String commentsCount = '0';
    String likesCount = '0';

    if (postInfo['post'] != null) {
      Post post = postInfo['post'] as DiaryPost;
      commentsCount = (postInfo['comments'] as List).length.toString();
      likesCount = post.likes.length.toString();
    }

    return Row(
      children: [
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border,
                size: 28, color: Colors.grey)),
        Text(likesCount,
            style: const TextStyle(color: Colors.grey, fontSize: 18)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, size: 28, color: Colors.grey)),
        IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.forum_outlined, size: 28, color: Colors.grey)),
        Text(commentsCount,
            style: const TextStyle(color: Colors.grey, fontSize: 18))
      ],
    );
  }

  Widget setPostBody(Map postInfo) {
    String title = '';
    String text = '';

    if (postInfo['post'] != null) {
      Post post = postInfo['post'] as DiaryPost;
      title = post.title;
      text = post.text;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text(title, style: const TextStyle(fontSize: 20)),
        SizedBox(height: 16),
        Text(text, style: const TextStyle(fontSize: 16))
      ],
    );
  }

  Widget createPost(Map postInfo) {
    int cellsCount = 1;

    if (postInfo['comments'] != null) {
      cellsCount = (postInfo['comments'] as List).length + 1;
    }

    return ListView.builder(
        itemCount: cellsCount,
        itemBuilder: (context, index) {
          if (index == 0) {
            return post(postInfo);
          }

          return createComment(postInfo, index);
        });
  }

  String getCommentText(Map postInfo, index) {
    String text = index.toString();

    if (postInfo['comments'] != null) {
      Comment comment = postInfo['comments'][index - 1];
      text = comment.text;
    }

    return text;
  }

  Widget createComment(Map postInfo, index) {
    if (postInfo['comments'] == null) {
      return Text('');
    }

    Comment comment = postInfo['comments'][index - 1];

    return Card(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PostHeaderView(user: comment.userInfo),
            SizedBox(height: 0),
            Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16.0),
                child: Text(
                  Helper().removeBBCodeFromString(comment.text),
                  style: TextStyle(fontSize: 16),
                ))
          ]),
    );
  }
}
