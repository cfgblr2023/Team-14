import 'package:flutter/material.dart';
import 'package:app/constants/colors.dart';
import 'package:app/router/app_router.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});  
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    // Returning the Material App
    return MaterialApp(
      title: 'Sensing Local',

      // Configuring Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SecondaryColor),
        useMaterial3: true,
      ),

      // Managing Routes
      onGenerateRoute: _appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
