import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/register.dart';

class AppRouter {
  AppRouter();

  // Function to Generate Routes
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return getIndexRoute();
      case 'register':
        return getRegisterRoute();
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

  // Function to Return the Register Route
  Route? getRegisterRoute() {
    return MaterialPageRoute(
      // Builder Function
      builder: (context) => const MyRegister(),
    );
  }
}
