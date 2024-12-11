// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quikmath/logic/core.dart';
import 'package:quikmath/widgets/homeScaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _pop = false;
  DateTime? _lastPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _pop,
      onPopInvokedWithResult: (r, o) async {
        final now = DateTime.now();
        if (_lastPressed == null ||
            now.difference(_lastPressed!) > Duration(seconds: 2)) {
          _lastPressed = now;
          QuikCore.doBreak();
          //print("hehe $r");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Press back again to exit')),
          );
          setState(() {
            _pop = false;
          });
          return; // Do not exit the app
        }
        setState(() {
          _pop = true;
        });
        return; // Exit the app
      },
      child: HomeScaffold(),
    );
  }
}
