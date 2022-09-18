
import 'package:flutter/cupertino.dart';

class TabDiaryView extends StatelessWidget {
  const TabDiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Text('Diary'),
        ),
      ));
  }
}