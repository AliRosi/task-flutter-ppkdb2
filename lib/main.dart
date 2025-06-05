import 'package:flutter/material.dart';
import 'package:tugas1_flutter/latihan_sqflite/login_screen_app.dart';
import 'package:tugas1_flutter/latihan_sqflite/register_screen.dart';
import 'package:tugas1_flutter/study_case/siswa_screen.dart';
import 'package:tugas1_flutter/tugas11_flutter/tugas10.dart';
import 'package:tugas1_flutter/tugas6_flutter/tugas6.dart';
import 'package:tugas1_flutter/tugas7_flutter/tugas7.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        fontFamily: 'Arimo',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const Splash(),
      initialRoute: LokasiFavoritScreen.id,
      routes: {
        // '/': (context) => const SplashScreen(),
        '/login': (context) => const TugasEnam(),
        '/home': (context) => const TugasTujuh(),
        //
        LoginScreenApp.id: (context) => LoginScreenApp(),
        RegisterScreen.id: (context) => RegisterScreen(),
        SiswaScreen.id: (context) => SiswaScreen(),
        LokasiFavoritScreen.id: (context) => LokasiFavoritScreen(),
      },
    );
  }
}
