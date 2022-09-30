import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/root_page.dart';

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
          dividerTheme: DividerThemeData()
              .copyWith(color: Colors.grey, indent: 16, endIndent: 16),
          cardTheme: CardTheme().copyWith(shadowColor: Colors.transparent)),

      // darkTheme: ThemeData().copyWith(
      //   brightness: Brightness.dark,
      //   scaffoldBackgroundColor: Colors.black45,
      //   cardTheme: CardTheme(color: Colors.indigo),
      //   textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      //   colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.brown),
      // ),
      themeMode: ThemeMode.system,
      home: const RootPage(),
    );
  }
}
