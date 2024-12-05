import 'package:flutter/material.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: Container(
            child: Text("Preferences"),
          )),
    );
  }
}
