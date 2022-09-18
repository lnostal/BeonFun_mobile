
import 'package:flutter/cupertino.dart';

class TabDiaryView extends StatelessWidget {
  
  final String title;

  const TabDiaryView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: const SafeArea(
        child: Center(
          child: Text('Diary'),
        ),
      )
    );
  }
}