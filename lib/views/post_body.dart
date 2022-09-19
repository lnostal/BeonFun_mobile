import 'package:flutter/material.dart';

class PostBody extends StatefulWidget {
  const PostBody({super.key});

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Caption',
            style: TextStyle(
              fontSize: 24
            ),
          ),
          SizedBox(height: 10),
          Text('''—порой мне снится, что я кто-то,
иду куда-то, знаю цель.
я просыпаюсь среди ночи
с холодным потом на лице.
я душ приму и с самокруткой
спущусь в закрытое метро,
там закурю и прыгну в утро,
где слава богу я никто.''',
            style: TextStyle(
              fontSize: 18
            ),
          )
        ],
      )
    );
  }
}