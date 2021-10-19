import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // light theme colors
  static Color lightBgColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = Colors.indigo;
  static Color lightAccentColor = Colors.blueGrey.shade200;

  // dark theme colors
  static Color darkBgColor = const Color(0xff1a2127);
  static Color darkPrimaryColor = Colors.indigo;
  static Color darkAccentColor = Colors.blueGrey.shade600;

  const AppTheme._();
  static final lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme.light(secondary: lightAccentColor),
    backgroundColor: lightBgColor,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: lightBgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: lightPrimaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: lightBgColor),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(secondary: darkAccentColor),
    primaryColor: darkPrimaryColor,
    backgroundColor: darkBgColor,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: darkBgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: darkPrimaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: darkBgColor),
    ),
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor:
          themeMode == ThemeMode.light ? lightBgColor : darkBgColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

// ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Colors.indigo,
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: AppBarTheme(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             centerTitle: true,
//             iconTheme: IconThemeData(color: Colors.indigo),
//             textTheme: TextTheme(
//                 headline6: TextStyle(
//               color: Colors.indigo,
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ))),
//       ),