import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/tab_diary/tab_diary_view.dart';
import 'package:flutter_beonfun/modules/tab_feed/tab_feed_view.dart';
import 'package:flutter_beonfun/modules/tab_messages/tab_messages_view.dart';
import 'package:flutter_beonfun/modules/tab_profile/tab_profile_view.dart';

class MainTabBar extends StatelessWidget{
  const MainTabBar({super.key});

  @override 
  Widget build(BuildContext context) => CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.brown,
        inactiveColor: Colors.grey,
        onTap: (index){
          print('Tab number $index');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_day),
            label: 'Feed'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Diary'),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Messages'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile')
            ]
          ), tabBuilder: (BuildContext context, int index) { 
            switch (index) {
              case 0:
               return const TabFeedView();
              case 1:
               return const TabDiaryView();
              case 2:
               return const TabMessagesView();
              case 3:
              default:
               return const TabProfileView();
            }
            //return Container();
           },
        );
  }