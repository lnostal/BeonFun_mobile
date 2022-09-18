import 'package:flutter/cupertino.dart';

class TabFeedView extends StatelessWidget {

  final String title;

  const TabFeedView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: const SafeArea(
        child: Center(
          child: Text('Feed'),
        ),
      )
    );
  }
}
