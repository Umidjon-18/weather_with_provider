import 'package:flutter/material.dart';

import '../ui/pages/home_page.dart';



class Routes {
  static const weatherPage = '/';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    try {
      Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case weatherPage:
          return MaterialPageRoute(builder: (context) => const HomePage());
        default:
          return MaterialPageRoute(builder: (context) => const HomePage());
      }
    } catch (e) {
      return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}