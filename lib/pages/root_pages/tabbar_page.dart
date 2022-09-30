import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/user_diary/user_diary_page.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/feed/feed_page.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/user_profile/profile_page.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            inactiveColor: Colors.grey,
            border: const Border(bottom: BorderSide(color: Colors.transparent)),
            height: 64,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.view_day)),
              BottomNavigationBarItem(icon: Icon(Icons.book)),
              //BottomNavigationBarItem(icon: Icon(Icons.question_answer)),
              BottomNavigationBarItem(icon: Icon(Icons.account_box))
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return FeedPage(
                title: 'Feed $index',
              );
            case 1:
              return UserDiaryPage(
                title: 'Diary $index',
              );
            case 2:
            // return TabMessagesView(
            //   title: 'Message $index',
            // );
            case 3:
            default:
              return UserProfilePage(
                title: 'Profile $index',
              );
          }
        },
      );
}
