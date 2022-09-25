import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/user.dart';

class AvatarView extends StatefulWidget {
  final User user;

  const AvatarView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<AvatarView> {
  final double avatarSize = 52;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(avatarSize / 2))),
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(avatarSize / 2)),
                    child: setImage(widget.user)))));
  }

  Image setImage(User user) {
    if (user.currentAvatar != null) {
      return Image.network(user.currentAvatar as String,
          width: avatarSize, height: avatarSize, fit: BoxFit.fill);
    }

    return Image.asset('assets/images/avatar_placeholder.png',
        width: avatarSize, height: avatarSize, fit: BoxFit.fitHeight);
  }
}
