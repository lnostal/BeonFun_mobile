import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/root_pages/auth_page.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/user_profile/subpages/about_app_page.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar/user_profile/subpages/unread_discussions_page.dart';
import 'package:flutter_beonfun/widgets/avatar_view.dart';
import 'package:flutter_beonfun/widgets/loader_view.dart';

import '../../../../models/user.dart';
import '../../../../net/general_network.dart';

class UserProfilePage extends StatefulWidget {
  final String title;

  const UserProfilePage({super.key, required this.title});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  User? user;

  void loadData() {
    Request().getCurrentUserInfo().then((User? newVal) {
      setState(() {
        user = newVal!;
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
        child: SafeArea(
      child: ListView.builder(
          //separatorBuilder: (context, index) => const Divider(),
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
          AvatarView(user: user, type: AvatarType.profile, avatarSize: 140),
          Text(user.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(
            user.sign ?? '',
            style: const TextStyle(
                fontSize: 16, color: Colors.grey, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              const Text('Баланс',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('${user.balance} позитивок',
                  style: const TextStyle(fontSize: 16))
            ],
          ),
        ]),
      ),
    );
  }

  Widget discussionsCell() {
    return cell(
      TextButton.icon(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UnreadDiscussionsPage()));
          },
          label: const Text(
            'Новые комментарии',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.end,
          ),
          icon: Icon(Icons.chat_bubble_outline_sharp)),
    );
  }

  Widget aboutAppCell() {
    return cell(
      TextButton.icon(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AboutAppPage()));
        },
        label: const Text(
          'О приложении',
          style: TextStyle(fontSize: 16),
        ),
        icon: Icon(Icons.app_shortcut),
      ),
    );
  }

  Widget exitCell() {
    return cell(
      TextButton.icon(
          onPressed: () {
            Request().logout().then((value) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const AuthPage()));
            });
          },
          label: Text(
            'Выход',
            style: TextStyle(fontSize: 16),
          ),
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.red,
          )),
    );
  }

  Widget cell(Widget child) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: child,
      ),
    );
  }
}
