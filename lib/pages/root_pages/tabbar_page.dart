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
              return SafeArea(
                  child: FeedPage(
                title: 'Feed $index',
              ));
            case 1:
              return SafeArea(
                  child: UserDiaryPage(
                title: 'Diary $index',
              ));
            case 2:
            // return TabMessagesView(
            //   title: 'Message $index',
            // );
            case 3:
            default:
              return SafeArea(
                  child: UserProfilePage(
                title: 'Profile $index',
              ));
          }
        },
      );
}
