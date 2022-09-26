import 'package:flutter/cupertino.dart';
import 'package:flutter_beonfun/ui/feed_list_view.dart';

class TabFeedView extends StatelessWidget {
  final String title;

  const TabFeedView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('✨ BeOn.Fun ✨'),
          backgroundColor: CupertinoColors.white,
        ),
        child: SafeArea(child: FeedListView()));
  }
}
