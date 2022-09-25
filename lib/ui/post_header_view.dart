import 'package:flutter/material.dart';
import 'package:flutter_beonfun/network/general_network.dart';
import 'package:flutter_beonfun/ui/avatar_view.dart';

import '../models/user.dart';

class PostHeaderView extends StatefulWidget {
  final User user;

  const PostHeaderView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<PostHeaderView> createState() => _PostHeaderViewState();
}

class _PostHeaderViewState extends State<PostHeaderView> {
  @override
  Widget build(BuildContext context) {
    if (widget.user.sign == null) {
      return Row(children: [
        const AvatarView(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.user.name,
                style: TextStyle(color: Colors.black, fontSize: 18))
          ],
        )
      ]);
    }

    return Row(children: [
      const AvatarView(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.user.name,
              style: TextStyle(color: Colors.black, fontSize: 18)),
          SizedBox(height: 6),
          Text(widget.user.sign ?? '',
              style: TextStyle(color: Colors.grey, fontSize: 14))
        ],
      )
    ]);
  }
}
