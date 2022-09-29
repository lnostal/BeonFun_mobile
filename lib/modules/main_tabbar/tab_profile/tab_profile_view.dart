import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/login.dart';
import 'package:flutter_beonfun/modules/main_tabbar/tab_profile/about_app_page.dart';
import 'package:flutter_beonfun/modules/main_tabbar/tab_profile/unread_discussions_page.dart';
import 'package:flutter_beonfun/ui/avatar_view.dart';
import 'package:flutter_beonfun/ui/loader.dart';

import '../../../models/post.dart';
import '../../../models/user.dart';
import '../../../network/general_network.dart';

class TabProfileView extends StatefulWidget {
  final String title;

  const TabProfileView({super.key, required this.title});

  @override
  State<TabProfileView> createState() => _TabProfileViewState();
}

class _TabProfileViewState extends State<TabProfileView> {
  User? user;
  List<Post> _posts = [];

  void loadData() {
    Request().getUserInfo().then((User newVal) {
      setState(() {
        user = newVal;
      });
    });

    Request().getDiscussions().then((value) {
      setState(() {
        _posts = value.where((element) => element.unread == true).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Loader();
    }

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(user!.blogStringId),
          backgroundColor: CupertinoColors.white,
        ),
        child: SafeArea(
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return profileCard(user!);
                  case 1:
                    return discussionsCell();
                  case 2:
                    return aboutAppCell();
                  case 3:
                    return exitCell();
                  default:
                    return const Text('');
                }
              }),
        ));
  }

  Widget profileCard(User user) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          AvatarView(user: user, type: AvatarType.profile, avatarSize: 160),
          Text(user.name,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            user.sign ?? '',
            style: const TextStyle(
                fontSize: 18, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              const Text('Баланс',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('${user.balance} позитивок',
                  style: const TextStyle(fontSize: 20))
            ],
          ),
        ]),
      ),
    );
  }

  Widget discussionsCell() {
    List<Widget> button = [
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Icon(Icons.chat_bubble_outline_sharp),
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UnreadDiscussionsPage(posts: _posts)));
          },
          child: const Text(
            'Discussions',
            style: TextStyle(fontSize: 20),
          ))
    ];

    if (_posts.isNotEmpty) {
      button.addAll([
        const Spacer(),
        const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: BlinkText(
              'New',
              style: TextStyle(color: Colors.red),
            ))
      ]);
    }

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: button,
      ),
    );
  }

  Widget aboutAppCell() {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.app_shortcut),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutAppPage()));
              },
              child: const Text(
                'About App',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }

  Widget exitCell() {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
          ),
          TextButton(
              onPressed: () {
                Request().logout().then((value) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage()));
                });
              },
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
