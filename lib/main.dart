import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/modules/main_tabbar/main_tabbar.dart';
import 'package:flutter_beonfun/modules/main_tabbar/new_tabbar.dart';

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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.red),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black),
      ),
      home: const MainTabBar(),
    );
  }
}
