import 'package:flutter/cupertino.dart';
import 'package:flutter_beonfun/utils/string_parser.dart';

import '../models/user.dart';

class AvatarExpanded extends StatefulWidget {
  final User user;

  const AvatarExpanded({super.key, required this.user});

  @override
  State<AvatarExpanded> createState() => _AvatarExpandedState();
}

class _AvatarExpandedState extends State<AvatarExpanded> {
  @override
  Widget build(BuildContext context) {
    String avatarUrl =
        widget.user.currentAvatar ?? StringParser().setAvatarPlaceholderUrl();

    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: FadeInImage(
            placeholder:
                const AssetImage('assets/images/avatar_placeholder.png'),
            image: NetworkImage(avatarUrl)));
  }
}
