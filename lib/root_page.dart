import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  Widget _rootWidget = Loader();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Request().tokenExpired().then((value) {
      setState(() {
        _rootWidget = value ? LoginPage() : MainTabBar();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _rootWidget;
  }
}
