import 'package:flutter/material.dart';
import 'package:flutter_beonfun/ui/avatar_view.dart';

class PostHeaderView extends StatefulWidget {
  const PostHeaderView({super.key});

  @override
  State<PostHeaderView> createState() => _PostHeaderViewState();
}

class _PostHeaderViewState extends State<PostHeaderView> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const AvatarView(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nickname', style: TextStyle(color: Colors.black, fontSize: 18)),
          SizedBox(height: 6),
          Text('piece of shit but smbd thinks it\'s funny',
              style: TextStyle(color: Colors.grey, fontSize: 14))
        ],
      )
    ]);
  }
}
