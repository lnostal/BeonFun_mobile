import 'package:flutter/cupertino.dart';

class TabMessagesView extends StatelessWidget {
  const TabMessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Text('Messages'),
        ),
      ));
  }
}