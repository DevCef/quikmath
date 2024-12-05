import 'package:flutter/material.dart';
import 'package:quikmath/widgets/pages/about.dart';
import 'package:quikmath/widgets/pages/home.dart';
import 'package:quikmath/widgets/pages/preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/preferences': (context) => const PreferencesPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
