import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_beonfun/views/diary_list_view.dart';

class TabDiaryView extends StatelessWidget {
  final String title;

  const TabDiaryView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Diary Name', style: TextStyle(fontSize: 24)),
        backgroundColor: CupertinoColors.white,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: fabPressed,
          backgroundColor: Colors.brown,
          child: const Icon(Icons.create)),
      body: SafeArea(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DiaryListView();
              })),
    );
  }

  void fabPressed() {
    print('ты лох не можешь всплывашку сделать');
  }
}
