import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/login.dart';
import 'package:flutter_beonfun/modules/main_tabbar/main_tabbar.dart';
import 'package:flutter_beonfun/network/general_network.dart';
import 'package:flutter_beonfun/ui/loader.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  Widget _rootWidget = const Scaffold(
    body: Loader(),
  );

  @override
  void initState() {
    super.initState();
    Request().tokenExpired().then((value) {
      setState(() {
        _rootWidget = value ? const LoginPage() : const MainTabBar();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _rootWidget;
  }
}
