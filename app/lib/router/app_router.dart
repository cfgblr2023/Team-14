import 'package:app/screens/upload.dart';
import 'package:app/screens/volunteerDashboard.dart';
import 'package:flutter/material.dart';

import '../screens/dashboard.dart';
import '../screens/home.dart';
import '../screens/register.dart';

class AppRouter {
  AppRouter();

  // Function to Generate Routes
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return getIndexRoute();
      case '/register':
        return getRegisterRoute();
      case '/volunteer-dashboard':
        return getVolunteerDashboardRoute();
      case '/dashboard':
        return getDashboardRoute();
    }
    return null;
  }

  Route? getDashboardRoute() {
    return MaterialPageRoute(
      // Builder Function
      builder: (context) => Upload(),
    );
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

  Route? getVolunteerDashboardRoute() {
    return MaterialPageRoute(
      // Builder Function
      builder: (context) => const VolunteerDashboard(),
    );
  }
}
