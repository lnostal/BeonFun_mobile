import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/tab_diary/tab_diary_view.dart';
import 'package:flutter_beonfun/modules/tab_feed/tab_feed_view.dart';
import 'package:flutter_beonfun/modules/tab_messages/tab_messages_view.dart';
import 'package:flutter_beonfun/modules/tab_profile/tab_profile_view.dart';

class MainTabBar extends StatelessWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            activeColor: Colors.brown,
            inactiveColor: Colors.grey,
            height: 64,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.view_day)),
              BottomNavigationBarItem(icon: Icon(Icons.book)),
              BottomNavigationBarItem(icon: Icon(Icons.question_answer)),
              BottomNavigationBarItem(icon: Icon(Icons.account_box))
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return TabFeedView(
                title: 'Feed $index',
              );
            case 1:
              return TabDiaryView(
                title: 'Diary $index',
              );
            case 2:
              return TabMessagesView(
                title: 'Message $index',
              );
            case 3:
            default:
              return TabProfileView(
                title: 'Profile $index',
              );
          }
        },
      );
}
