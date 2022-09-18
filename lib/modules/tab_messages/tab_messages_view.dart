import 'package:flutter/cupertino.dart';

class TabMessagesView extends StatelessWidget {

  final String title;

  const TabMessagesView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: const SafeArea(
        child: Center(
          child: Text('Messages'),
        ),
      )
    );
  }
}