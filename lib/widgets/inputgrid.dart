import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';

class InputGrid extends StatelessWidget {
  const InputGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
      // - Clear button
      SizedBox(
        height: 64,
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            48,
            0,
            48,
            0,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0, // Remove shadow
              
              backgroundColor: Colors.purple[200],
              foregroundColor: Color.lerp(Colors.purple[300], Colors.black, 0.5),
            ),
            onPressed: () => {},
            child: const Center(
              child: Text(
                "C",
                style: TextStyle(
                  fontSize: 48,
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
            48,
            16,
            48,
            16,
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true, // Prevents the GridView from being scrollable
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 32, // Spacing between columns
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
                onPressed: () async {
                  // Handle button press
                  print(index);
                  Vibration.vibrate(
                    duration: 200,
                  );
                  bool? response = await Vibration.hasVibrator();
                  if (response == true)
                    print("vibrated");
                  else
                    print("no vibration support");
                },
                child: Text(
                  _getButtonText(index),
                  style: const TextStyle(fontSize: 48),
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }

  // A function to get the text for each button
  String _getButtonText(int index) {
    const buttonLabels = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '-',
      '0',
      '÷',
    ];
    return buttonLabels[index];
  }
}
