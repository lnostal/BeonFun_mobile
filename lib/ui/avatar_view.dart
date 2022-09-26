import 'package:flutter/material.dart';

import '../models/user.dart';

class AvatarView extends StatefulWidget {
  final User user;
  final double avatarSize;

  const AvatarView({Key? key, required this.user, required this.avatarSize})
      : super(key: key);

  @override
  State<AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<AvatarView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.avatarSize / 2))),
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.avatarSize / 2)),
                child: setImage(widget.user))));
  }

  Image setImage(User user) {
    if (user.currentAvatar != null) {
      return Image.network(user.currentAvatar as String,
          width: widget.avatarSize,
          height: widget.avatarSize,
          fit: BoxFit.fill);
    }

    return Image.asset('assets/images/avatar_placeholder.png',
        width: widget.avatarSize,
        height: widget.avatarSize,
        fit: BoxFit.fitHeight);
  }
}
