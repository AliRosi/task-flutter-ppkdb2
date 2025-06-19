import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas14_flutter/screens/pokemon_home_screen.dart';

class PokemonSplashScreen extends StatefulWidget {
  const PokemonSplashScreen({super.key});

  @override
  State<PokemonSplashScreen> createState() => _PokemonSplashScreenState();
}

class _PokemonSplashScreenState extends State<PokemonSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PokemonHomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/pikawave.gif', width: 200),
            SizedBox(height: 20),
            Text(
              'PokeDex',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
