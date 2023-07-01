import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      title: 'Sensing Local',
      theme: ThemeData(
          // Customize your app's theme here
          ),
      routes: {
        '/': (context) => Login(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
