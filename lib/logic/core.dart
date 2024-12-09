import 'dart:async';

class QuikCore {
  QuikCore._();

  static Timer? timer;
  static bool isRunning = false;
// Timer instance
  static int timerMilliseconds = 0; // Elapsed time in milliseconds
  static void Function(void Function())? mathscreenStateFunc;
  
  // Start the timer
  static void _setTimerState(bool shouldRun) {
    if (isRunning == shouldRun) return; // Avoid unnecessary updates

    mathscreenStateFunc!(() {
      isRunning = shouldRun;
    });

    if (isRunning) {
      // Start or resume the timer
      timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
        mathscreenStateFunc!(() {
          timerMilliseconds += 1;
        });
      });
    } else {
      // Pause the timer
      timer?.cancel();
    }
  }

  // Reset the timer
  static void _resetTimer() {
    mathscreenStateFunc!(() {
      isRunning = false;
      timerMilliseconds = 0;
    });
    timer?.cancel();
  }

  // @override
  // void dispose() {
  //   _timer?.cancel(); // Cancel timer when widget is disposed
  //   super.dispose();
  // }
  static void doStart()
  {
    _setTimerState(true);
  }

  static void doBreak()
  {
    _setTimerState(false);
    _resetTimer();
  }

}