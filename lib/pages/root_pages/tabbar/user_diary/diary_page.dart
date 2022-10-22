import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/common_pages/new_post_page.dart';
import 'package:flutter_beonfun/widgets/tabbar_lists/friend_list_view.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../widgets/tabbar_lists/diary_list_view.dart';

class DiaryPage extends StatefulWidget {
  final String title;

  const DiaryPage({Key? key, required this.title}) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage>
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
    var primaryColor = Theme.of(context).primaryColor;
    var backgroudColor = Theme.of(context).backgroundColor;

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
          floatingActionButton: SpeedDial(
            icon: Icons.create,
            activeIcon: Icons.close,
            spacing: 8,
            overlayColor: backgroudColor,
            overlayOpacity: 0.5,
            children: [
              SpeedDialChild(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                labelBackgroundColor: backgroudColor,
                onTap: newPostButtonPressed,
                label: 'В дневник',
                child: const Icon(Icons.book_sharp),
              ),
              SpeedDialChild(
                label: 'На форум',
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                labelBackgroundColor: backgroudColor,
                child: const Icon(Icons.people),
              )
            ],
          )
          // FloatingActionButton(
          //     onPressed: newPostButtonPressed, child: const Icon(Icons.create)),
          ),
    );
  }
}
