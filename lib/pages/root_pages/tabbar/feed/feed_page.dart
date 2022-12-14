import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/tabbar_lists/feed_list_view.dart';

class FeedPage extends StatelessWidget {
  final String title;

  const FeedPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text('✨ BeOn.Fun ✨'),
            border: Border(bottom: BorderSide(color: Colors.transparent))),
        child: SafeArea(child: FeedListView()));
  }
}
