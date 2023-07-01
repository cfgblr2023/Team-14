import 'package:app/components/GradientContainer.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientContainer(
        colors: [PrimaryColor, SecondaryColor],
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/images/home.png'),
              ),
            ),
            Text("Hello World!"),
          ],
        )),
      ),
    );
  }
}
