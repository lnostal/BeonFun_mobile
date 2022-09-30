import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/root_pages/auth_page.dart';
import 'package:flutter_beonfun/pages/root_pages/tabbar_page.dart';
import 'package:flutter_beonfun/net/general_network.dart';
import 'package:flutter_beonfun/widgets/loader_view.dart';

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
        _rootWidget = value ? const AuthPage() : const TabBarPage();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _rootWidget;
  }
}
