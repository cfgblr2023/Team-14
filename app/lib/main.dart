import 'package:flutter/material.dart';
import 'package:app/constants/colors.dart';
import 'package:app/router/app_router.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      title: 'Sensing Local',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SecondaryColor),
        useMaterial3: true,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
