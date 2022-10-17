import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/net/general_network.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/messanger/messages_page.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/user_diary/diary_page.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/feed/feed_page.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/user_profile/profile_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  bool showNewMessageBadge = false;
  bool showNewDiscussionsBadge = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      checkUpdates();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            border: const Border(bottom: BorderSide(color: Colors.transparent)),
            height: 64,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.view_day)),
              BottomNavigationBarItem(icon: Icon(Icons.book)),
              BottomNavigationBarItem(
                  icon: Badge(
                child: Icon(Icons.question_answer),
                showBadge: showNewMessageBadge,
              )),
              BottomNavigationBarItem(
                  icon: Badge(
                child: Icon(Icons.account_box),
                showBadge: showNewDiscussionsBadge,
              ))
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return SafeArea(
                  child: FeedPage(
                title: 'Feed $index',
              ));
            case 1:
              return SafeArea(
                  child: DiaryPage(
                title: 'Diary $index',
              ));
            case 2:
              return MessagesPage(
                title: 'Message $index',
              );
            case 3:
            default:
              return SafeArea(
                  child: UserProfilePage(
                title: 'Profile $index',
              ));
          }
        },
      );

  void checkUpdates() {
    Request().getNotifications().then((value) {
      var messages = value['messages'] as int;
      var chats = value['chats'] as int;
      var discussions = value['discussions'] as int;

      setState(() {
        showNewMessageBadge = messages == 1 || chats == 1;
        showNewDiscussionsBadge = discussions == 1;
      });
    });
  }
}
