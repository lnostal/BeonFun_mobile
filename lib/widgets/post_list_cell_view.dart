import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/common_pages/about_user_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post.dart';
import 'post/post_body.dart';
import 'post/post_footer_view.dart';
import 'post/post_header_view.dart';

class PostListCellView extends StatefulWidget {
  final bool showUserInfo;
  final Post post;
  const PostListCellView(
      {super.key, required this.showUserInfo, required this.post});

  @override
  State<PostListCellView> createState() => _PostListCellViewState();
}

class _PostListCellViewState extends State<PostListCellView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> postParts = [
      PostBody(post: widget.post),
      PostFooterView(post: widget.post)
    ];

    if (widget.showUserInfo) {
      Widget temp = Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: GestureDetector(
          onTap: openUserProfile,
          child: PostHeaderView(
            user: widget.post.userInfo,
            post: widget.post,
          ),
        ),
      );

      postParts.insert(0, temp);
    } else {
      postParts.insert(0, const SizedBox(height: 32));
    }

    return Card(
        child: Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: postParts,
      ),
      Positioned(
          right: 14,
          top: 8,
          child: Icon(
            Icons.lock,
            size: 15,
            color: setLockColor(context),
          ))
    ]));
  }

  Color setLockColor(context) {
    if (widget.post.type != PostType.forum) {
      if (widget.post.postAccess == PostPrivateSettings.me) {
        return Theme.of(context).iconTheme.color!;
      }
    }
    return Colors.transparent;
  }

  void openUserProfile() async {
    var prefs = await SharedPreferences.getInstance();
    String? blog = prefs.getString('blogStringId');

    if (widget.post.userInfo.blogStringId == blog) {
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AboutUserPage(user: widget.post.userInfo)));
  }
}
