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
      theme: createLightTheme(),
      darkTheme: createDarkTheme(),
      themeMode: ThemeMode.system,
      home: const RootPage(),
    );
  }

  ThemeData createLightTheme() {
    const backgroundColor = Color.fromRGBO(218, 215, 205, 1);
    const textColor = Colors.black;
    const textSubtitleColor = Colors.grey;
    const accentColor = Colors.brown;

    return ThemeData().copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ThemeData().colorScheme.copyWith(primary: accentColor),
        dividerTheme: const DividerThemeData()
            .copyWith(color: textSubtitleColor, indent: 16, endIndent: 16),
        cardTheme: const CardTheme().copyWith(
            shadowColor: Colors.transparent, color: Colors.transparent),
        floatingActionButtonTheme: const FloatingActionButtonThemeData()
            .copyWith(backgroundColor: accentColor),
        iconTheme:
            const IconThemeData().copyWith(size: 28, color: textSubtitleColor),
        tabBarTheme: const TabBarTheme(
            unselectedLabelColor: textSubtitleColor,
            labelColor: accentColor,
            indicatorSize: TabBarIndicatorSize.label),
        indicatorColor: accentColor,
        textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 20, color: textColor),
            headlineSmall: TextStyle(fontSize: 14, color: textSubtitleColor),
            bodyMedium: TextStyle(fontSize: 16, color: textColor),
            headlineMedium: TextStyle(fontSize: 18, color: textColor)),
        cupertinoOverrideTheme: const CupertinoThemeData(
            brightness: Brightness.light,
            barBackgroundColor: backgroundColor,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: CupertinoTextThemeData(
                navActionTextStyle: TextStyle(color: accentColor, fontSize: 17),
                navTitleTextStyle: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500))),
        inputDecorationTheme: const InputDecorationTheme().copyWith(
            labelStyle: const TextStyle(fontSize: 16, color: textColor),
            hintStyle: const TextStyle(fontSize: 16, color: textColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: textColor, width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 1.5, color: accentColor))));
  }

  ThemeData createDarkTheme() {
    const backgroundColor = Color.fromRGBO(41, 49, 50, 1);
    const textColor = Color.fromARGB(255, 144, 144, 144);
    const textSubtitleColor = Color.fromARGB(255, 90, 90, 90);
    const accentColor = Color.fromRGBO(163, 177, 138, 1);

    return ThemeData().copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ThemeData().colorScheme.copyWith(primary: accentColor),
        dividerTheme: const DividerThemeData()
            .copyWith(color: textSubtitleColor, indent: 16, endIndent: 16),
        cardTheme: const CardTheme().copyWith(
            shadowColor: Colors.transparent, color: Colors.transparent),
        floatingActionButtonTheme: const FloatingActionButtonThemeData()
            .copyWith(backgroundColor: accentColor),
        iconTheme:
            const IconThemeData().copyWith(size: 28, color: textSubtitleColor),
        tabBarTheme: const TabBarTheme(
            unselectedLabelColor: textSubtitleColor,
            labelColor: accentColor,
            indicatorSize: TabBarIndicatorSize.label),
        indicatorColor: accentColor,
        textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 20, color: textColor),
            headlineSmall: TextStyle(fontSize: 14, color: textSubtitleColor),
            bodyMedium: TextStyle(fontSize: 16, color: textColor),
            headlineMedium: TextStyle(fontSize: 18, color: textColor)),
        cupertinoOverrideTheme: const CupertinoThemeData(
            brightness: Brightness.light,
            barBackgroundColor: backgroundColor,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: CupertinoTextThemeData(
                navActionTextStyle: TextStyle(color: accentColor, fontSize: 17),
                navTitleTextStyle: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500))),
        inputDecorationTheme: const InputDecorationTheme().copyWith(
            labelStyle: const TextStyle(fontSize: 16, color: textSubtitleColor),
            hintStyle: const TextStyle(fontSize: 16, color: textSubtitleColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: textSubtitleColor, width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 1.5, color: accentColor))));
  }
}
