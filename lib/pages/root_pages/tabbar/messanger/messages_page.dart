import 'package:flutter/cupertino.dart';

class MessagesPage extends StatelessWidget {
  final String title;

  const MessagesPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(title),
          backgroundColor: CupertinoColors.white,
        ),
        child: const SafeArea(
          child: Center(
            child: Text('Messages'),
          ),
        ));
  }
}
