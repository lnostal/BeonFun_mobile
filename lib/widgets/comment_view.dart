import 'package:flutter/material.dart';
import 'package:flutter_bbcode/flutter_bbcode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../pages/common_pages/about_user_page.dart';
import '../utils/string_parser.dart';
import 'post/post_header_view.dart';

class CommentView extends StatefulWidget {
  //final Comment comment;
  final User user;
  final String text;
  const CommentView({super.key, required this.user, required this.text});

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
            GestureDetector(
                onTap: openUserProfile,
                child: PostHeaderView(user: widget.user)),
            const SizedBox(height: 0),
            Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16.0),
                child: BBCodeText(
                  selectable: true,
                  data: StringParser().toRenderedString(widget.text),
                  defaultStyle: Theme.of(context).textTheme.bodyMedium,
                ))
          ]),
    );
  }

  void openUserProfile() async {
    var prefs = await SharedPreferences.getInstance();
    String? blog = prefs.getString('blogStringId');

    if (widget.user.blogStringId == blog) {
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AboutUserPage(user: widget.user)));
  }
}
