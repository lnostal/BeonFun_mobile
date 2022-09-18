import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/views/feed_table_view.dart';

class TabFeedView extends StatelessWidget {

  final String title;

  const TabFeedView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // ignore: prefer_const_constructors
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          '✨ BeOn.Fun ✨',
          style: TextStyle(
            fontSize: 24)
          )
         ),
        // ignore: prefer_const_constructors
        child: SafeArea(
            child: const FeedTableView(),
        )
    );
  }
}
