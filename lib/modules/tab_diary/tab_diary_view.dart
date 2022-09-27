import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_beonfun/modules/tab_diary/diary_list_view.dart';

class TabDiaryView extends StatelessWidget {
  final String title;

  const TabDiaryView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Diary Name'),
        backgroundColor: CupertinoColors.white,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: fabPressed,
          backgroundColor: Colors.brown,
          child: const Icon(Icons.create)),
      body: const SafeArea(child: DiaryListView()),
    );
  }

  void fabPressed() {
    debugPrint('ты лох не можешь всплывашку сделать');
  }
}
