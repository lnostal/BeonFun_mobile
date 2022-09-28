import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/login.dart';
import 'package:flutter_beonfun/modules/main_tabbar/main_tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beon.fun',
      theme: ThemeData().copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.brown),
      ),
      // darkTheme: ThemeData().copyWith(
      //   brightness: Brightness.dark,
      //   scaffoldBackgroundColor: Colors.black45,
      //   cardTheme: CardTheme(color: Colors.indigo),
      //   textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      //   colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.brown),
      // ),
      themeMode: ThemeMode.system,
      home: const LoginPage(), //const MainTabBar(),
    );
  }
}
