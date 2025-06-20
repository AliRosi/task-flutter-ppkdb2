import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas15_flutter/helper/shared_pref.dart';
import 'package:tugas1_flutter/tugas15_flutter/screens/login_screen.dart';
import 'package:tugas1_flutter/tugas15_flutter/screens/profile_screen.dart';

class SplashScreennn extends StatefulWidget {
  const SplashScreennn({super.key});

  @override
  State<SplashScreennn> createState() => _SplashScreennnState();
}

class _SplashScreennnState extends State<SplashScreennn> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final loggedIn = await SharedPrefHelper.isLoggedIn();

    await Future.delayed(const Duration(seconds: 2));

    if (loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreenn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Text(
          "My Flutter App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
