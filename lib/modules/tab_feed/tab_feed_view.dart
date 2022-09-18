import 'package:flutter/cupertino.dart';

class TabFeedView extends StatelessWidget {
  const TabFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Text('Feed'),
        ),
      ));
  }
}
