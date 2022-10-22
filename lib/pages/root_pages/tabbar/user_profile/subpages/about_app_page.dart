import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/net/general_network.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common_pages/about_user_page.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  Map appInfo = {};

  void loadData() {
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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text('О приложении'),
          border: Border(bottom: BorderSide(color: Colors.transparent))),
      child: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [aboutApp(), aboutCreator()]))),
    );
  }

  Widget aboutCreator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: Column(
        children: [
          Text(
              'сказать спасибо • сказать о багах • скинуть на лечение\n\n⇩⇩⇩\n',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          TextButton.icon(
              onPressed: () {
                openUserProfile('30');
              },
              icon: Icon(Icons.app_shortcut),
              label: Text('Марла')),
          TextButton.icon(
              onPressed: () {
                openUserProfile('1');
              },
              icon: Icon(Icons.web),
              label: Text('ghostrider')),
          //TextButton(onPressed: (){}, child: child)
        ],
      )),
    );
  }

  Widget aboutApp() {
    String about = '\n';

    appInfo.forEach((key, value) {
      about += '$key ❀ $value \n';
    });
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Text(
          about,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        )));
  }

  void openUserProfile(String id) async {
    var user = await Request().getUserInfo(id);

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AboutUserPage(user: user)));
  }
}
