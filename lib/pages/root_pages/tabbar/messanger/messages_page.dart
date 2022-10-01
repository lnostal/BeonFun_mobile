import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  final String title;

  const MessagesPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(title),
            border:
                const Border(bottom: BorderSide(color: Colors.transparent))),
        child: const SafeArea(
          child: Center(
            child: Text('Messages'),
          ),
        ));
  }
}
