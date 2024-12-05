// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple[500],
      ),
      body: Column(
        verticalDirection: VerticalDirection.down,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
          ),
          
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
