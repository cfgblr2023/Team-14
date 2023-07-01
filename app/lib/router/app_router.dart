import 'package:flutter/material.dart';

import '../screens/home.dart';

class AppRouter {
  AppRouter();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return getIndexRoute();
    }

    return null;
  }

  Route? getIndexRoute() {
    return MaterialPageRoute(
      builder: (context) => const Home(),
    );
  }
}
