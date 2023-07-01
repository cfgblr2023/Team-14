import 'package:app/components/GradientContainer.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        colors: const [PrimaryColor, PrimaryColor, SecondaryColor],
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Walkable Cities",
                style: GoogleFonts.poppins(
                    color: White, fontSize: 40, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              child: const Image(
                image: AssetImage('assets/images/home.png'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 40),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.login),
                label: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  foregroundColor: PrimaryColor,
                  minimumSize: const Size(350, 50),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                icon: const Icon(Icons.volunteer_activism),
                label: const Text(
                  "Become a Volunteer",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  foregroundColor: PrimaryColor,
                  minimumSize: const Size(350, 50),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              icon: const Icon(Icons.app_registration_rounded),
              label: const Text(
                "Register",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                foregroundColor: PrimaryColor,
                minimumSize: const Size(350, 50),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
