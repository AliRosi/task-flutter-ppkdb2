import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas15_flutter/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Arimo',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreennn(),
      // initialRoute: LokasiFavoritScreen.id,
      // routes: {
      //   // '/': (context) => const SplashScreen(),
      //   '/login': (context) => const TugasEnam(),
      //   '/home': (context) => const TugasTujuh(),
      //   //
      //   LoginScreenApp.id: (context) => LoginScreenApp(),
      //   RegisterScreen.id: (context) => RegisterScreen(),
      //   SiswaScreen.id: (context) => SiswaScreen(),
      //   LokasiFavoritScreen.id: (context) => LokasiFavoritScreen(),
      // },
    );
  }
}
