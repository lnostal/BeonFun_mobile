import 'package:flutter/material.dart';
import 'package:flutter_beonfun/views/avatar_view.dart';


class PostHeadView extends StatefulWidget {
  const PostHeadView({super.key});

  @override
  State<PostHeadView> createState() => _PostHeadViewState();
}

class _PostHeadViewState extends State<PostHeadView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
        const AvatarView(),
        Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nickname',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18
              )
            ),
            SizedBox(height: 10),
            Text('piece of shit but smbd thinks it\'s funny',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14
              )
           )
          ],
        )
      ]),
    );
  }
}