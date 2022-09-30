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
        return Scaffold(
          appBar: const CupertinoNavigationBar(
            backgroundColor: Colors.white,
            middle: TabBar(
              indicatorColor: Colors.brown,
              labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              labelColor: Colors.black,
              tabs: [Tab(text: 'Дневник'), Tab(text: 'Записи друзей')],
            ),
          ),
          body: const TabBarView(children: [DiaryListView(), FriendListView()]),
          floatingActionButton: FloatingActionButton(
              onPressed: newPostButtonPressed,
              backgroundColor: Colors.brown,
              child: const Icon(Icons.create)),
        );
      }),
    );
  }

  void newPostButtonPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const WriteNewPost()));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: const CupertinoNavigationBar(
  //       middle: Text('Diary'),
  //       backgroundColor: CupertinoColors.white,
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //         onPressed: fabPressed,
  //         backgroundColor: Colors.brown,
  //         child: const Icon(Icons.create)),
  //     body: const SafeArea(
  //         child: TabBar(controller: _tabController, tabs: [
  //       Tab(
  //         icon: Icon(Icons.book),
  //         text: 'Diary',
  //       ),
  //       Tab(
  //         icon: Icon(Icons.person),
  //         text: 'Friends',
  //       )
  //     ])),
  //   );
  // }

}
