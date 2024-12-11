import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quikmath/logic/core.dart';

class MathScreen extends StatefulWidget {
  const MathScreen({super.key});

  @override
  State<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
  @override
  Widget build(BuildContext context) {
    QuikCore.mathscreenStateFunc = setState;
    // TODO : Temp
    QuikCore.doStart();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              // o) Timer
              Center(
                child: Text(
                  "${(QuikCore.timerMilliseconds / 100).toStringAsFixed(2)}s",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              // o) Equation both question & answer
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: AutoSizeText.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: "Jetbrains",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "4x3",
                          ),
                          TextSpan(
                            text: "=",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          TextSpan(
                            text: QuikCore.answer,
                            style: TextStyle(color: Colors.purple[700]),
                          ),
                        ],
                      ),
                      presetFontSizes: [48, 32, 24,  ],
                      maxLines: 1,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
