import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/helpers.dart';

import '../models/user.dart';

class AvatarView extends StatefulWidget {
  final User user;
  final double avatarSize;
  final AvatarType type;

  const AvatarView(
      {Key? key,
      required this.user,
      this.type = AvatarType.current,
      this.avatarSize = 52})
      : super(key: key);

  @override
  State<AvatarView> createState() => _AvatarViewState();
}

enum AvatarType { profile, current }

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
                child: setImage(widget.user, widget.type))));
  }

  CachedNetworkImage setImage(User user, AvatarType type) {
    AssetImage placeholder =
        const AssetImage('assets/images/avatar_placeholder.png');

    String imageUrl = Helper().setAvatarPlaceholderUrl();

    if (type == AvatarType.profile) {
      imageUrl = user.profileImageUrl;
    }

    if (type == AvatarType.current && user.currentAvatar != null) {
      imageUrl = user.currentAvatar as String;
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: widget.avatarSize,
      height: widget.avatarSize,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Image(
        image: placeholder,
        width: widget.avatarSize,
        height: widget.avatarSize,
        fit: BoxFit.fill,
      ),
    );
  }
}
