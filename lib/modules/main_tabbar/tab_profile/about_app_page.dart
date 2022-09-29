import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

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
        middle: Text('About App'),
      ),
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [aboutApp(), aboutCreator()])),
    );
  }

  Widget aboutCreator() {
    return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'сказать спасибо • сказать о багах • скинуть на лечение\n\n⇩⇩⇩\n\nМарла',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ));
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
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              decoration: TextDecoration.none),
        )));
  }
}
