import 'package:flutter/material.dart';
import 'package:flutter_beonfun/widgets/avatar_view.dart';

import '../../models/post.dart';
import '../../models/user.dart';

class PostHeaderView extends StatefulWidget {
  final Post? post;
  final User user;

  const PostHeaderView({
    Key? key,
    this.post,
    required this.user,
  }) : super(key: key);

  @override
  State<PostHeaderView> createState() => _PostHeaderViewState();
}

class _PostHeaderViewState extends State<PostHeaderView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> headers = [
      Text(widget.user.name,
          style: const TextStyle(color: Colors.black, fontSize: 18),
          overflow: TextOverflow.ellipsis)
    ];

    headers.addAll(createSign());

    return Row(children: [
      AvatarView(user: widget.user),
      Flexible(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: headers))
    ]);
  }

  List<Widget> createSign() {
    String sign = '';

    if (widget.user.sign != null) {
      sign = widget.user.sign!;
    }

    if (widget.post != null) {
      if (widget.post!.type != PostType.diary) {
        sign = widget.post!.type == PostType.forum
            ? 'на форуме ${widget.post!.forum!.title}'
            : 'в сообществе ${widget.post!.blogInfo!.title}';
      }
    }

    if (sign.isEmpty) {
      return [];
    }

    return [
      const SizedBox(height: 6),
      Text(sign,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
          overflow: TextOverflow.visible)
    ];
  }
}
