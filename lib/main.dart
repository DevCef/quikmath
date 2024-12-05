import 'package:flutter/material.dart';
import 'package:quikmath/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        //'/second': (context) => const SecondScreen(),
      },
    );
  }
}
