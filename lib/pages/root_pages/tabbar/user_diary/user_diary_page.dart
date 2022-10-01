import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/common_pages/new_post_page.dart';
import 'package:flutter_beonfun/widgets/tabbar_lists/friend_list_view.dart';

import '../../../../widgets/tabbar_lists/diary_list_view.dart';

class UserDiaryPage extends StatefulWidget {
  final String title;

  const UserDiaryPage({Key? key, required this.title}) : super(key: key);

  @override
  State<UserDiaryPage> createState() => _UserDiaryPageState();
}

class _UserDiaryPageState extends State<UserDiaryPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index

          }
        });
        return page();
      }),
    );
  }

  void newPostButtonPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const WriteNewPost()));
  }

  Widget page() {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
          middle: Text('Дневник'),
          border: Border(bottom: BorderSide(color: Colors.transparent))),
      body: Scaffold(
        appBar: const TabBar(
          indicatorWeight: 1.0,
          labelStyle: TextStyle(fontSize: 16),
          tabs: [Tab(text: 'Мои записи'), Tab(text: 'Записи друзей')],
        ),
        body: const TabBarView(children: [DiaryListView(), FriendListView()]),
        floatingActionButton: FloatingActionButton(
            onPressed: newPostButtonPressed, child: const Icon(Icons.create)),
      ),
    );
  }
}
