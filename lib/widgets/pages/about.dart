import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text("About"),
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            "QuikMath",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          )),
          Text(
            "data",
          )
        ],
      ),
    );
  }
}
