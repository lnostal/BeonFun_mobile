import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/ui/avatar_view.dart';
import 'package:flutter_beonfun/ui/loader.dart';
import 'package:package_info/package_info.dart';

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

  Map appInfo = {};

  void loadData() {
    Request().getUserInfo().then((User newVal) {
      setState(() {
        user = newVal;
      });
    });

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        appInfo.addAll({
          'AppName': packageInfo.appName,
          'Version': packageInfo.version,
          'BuildNumber': packageInfo.buildNumber
        });
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
                    return aboutCreator();
                  case 2:
                    return aboutApp();
                  case 3:
                    return logoutButton();
                  default:
                    return aboutApp();
                }
              }),

          // child: Column(
          //   children: [
          //     profileCard(user!),
          //     aboutCreator(),
          //     aboutApp(),
          //     logoutButton(),
          //   ],
          // ),
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

  Widget logoutButton() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: const [
          Icon(
            Icons.exit_to_app,
            color: Colors.red,
            size: 32,
          ),
          SizedBox(width: 8),
          Text('Выйти', style: TextStyle(fontSize: 20))
        ]),
      ),
    );
  }

  Widget aboutApp() {
    String about = '\n';

    appInfo.forEach((key, value) {
      about += '$key : $value \n';
    });
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Text(
            about,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ))),
    );
  }

  Widget aboutCreator() {
    return const Card(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Text(
            'сказать спасибо • сказать о багах • скинуть на лечение\n⇩⇩⇩\nМарла',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ))),
    );
  }
}
