import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AvatarView extends StatefulWidget {
  const AvatarView({super.key});

  @override
  State<AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<AvatarView> {
  final double avatarSize = 44;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0),
                    borderRadius:
                        BorderRadius.all(Radius.circular(avatarSize / 2))),
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(avatarSize / 2)),
                    child: Image.asset('assets/images/smile.png',
                        width: avatarSize,
                        height: avatarSize,
                        fit: BoxFit.fitWidth)))));
  }
}
