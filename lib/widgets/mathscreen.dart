import 'dart:async';

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
                child: Row(
                  children: [
                    // o) Question
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          //color: Colors.purple[200],
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          "1 + 2",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.purple[500],
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      child: Text(
                        "=",
                        style: TextStyle(
                          color: Colors.black.withAlpha(64),
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // o) Answer
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          if (QuikCore.isRunning) {
                            QuikCore.doBreak();
                          } else {
                            QuikCore.doStart();
                          }
                        }),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.linear,
                          height: 128,
                          margin: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: QuikCore.isRunning ? Colors.white : Colors.red[100],
                          ),
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "3",
                                      style: TextStyle(
                                        color: QuikCore.isRunning
                                            ? Colors.black
                                            : Colors.red,
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "_",
                                      style: TextStyle(
                                        color: QuikCore.isRunning
                                            ? Colors.black
                                            : Colors.red,
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
