import 'package:flutter/material.dart';

import '../screens/home.dart';

class AppRouter {
  AppRouter();

  // Function to Generate Routes
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return getIndexRoute();
    }

    return null;
  }

  // Function to Return the Home Screen
  Route? getIndexRoute() {
    return MaterialPageRoute(
      // Builder Function
      builder: (context) => const Home(),
    );
  }
}
