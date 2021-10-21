import 'package:flutter/material.dart';
import 'package:two_dos/presentation/screens/about_screen/about_screen.dart';
import 'package:two_dos/presentation/screens/add_item_screen/add_item_screen.dart';
import 'package:two_dos/presentation/screens/splash_screen/splash_screen.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../../main.dart';

class AppRouter {
  static const String home = 'home';
  static const String second = 'second';
  static const String about = 'about';
  static const String load = 'load';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomePage(
            title: Strings.homeScreenTitle,
          ),
        );
      case second:
        return MaterialPageRoute(
          builder: (_) => AddNewItem(
            title: Strings.addNewItemScreenTitle,
          ),
        );
      case about:
        return MaterialPageRoute(
          builder: (_) => AboutScreen(
            title: Strings.aboutScreenTitle,
          ),
        );
      case load:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
