import 'package:flutter/cupertino.dart';

class TabProfileView extends StatelessWidget {
  const TabProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Text('Profile'),
        ),
      ));
  }
}