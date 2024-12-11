import 'package:quikmath/logic/core.dart';
import 'package:quikmath/logic/utils.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';

class InputGrid extends StatelessWidget {
  const InputGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // - Clear button
      SizedBox(
        height: 48,
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            40,
            0,
            40,
            0,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0, // Remove shadow

              backgroundColor: Colors.purple[200],
              foregroundColor:
                  Color.lerp(Colors.purple[300], Colors.black, 0.5),
            ),
            onPressed: () => {
              _pressButton(-1)
            },
            child: const Center(
              child: Text(
                "CLEAR",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
      ),

      // - Other buttons
      Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            72,
            16,
            72,
            16,
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 12, // Spacing between columns
              mainAxisSpacing: 12, // Spacing between rows
            ),
            itemCount: 12, // Total number of buttons
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0, // Remove shadow
                  backgroundColor: Colors.purple[200],
                  foregroundColor:
                      Color.lerp(Colors.purple[400], Colors.black, 0.5),
                ),
                onPressed: () => {
                  _pressButton(index)
                },
                child: Text(
                  QuikCore.getButtonText(index),
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }

  void _pressButton(int index) {
    print(index);
    Vibration.vibrate(
      duration: 25,
    );
    QuikCore.receiveButton(index);
  }
}
