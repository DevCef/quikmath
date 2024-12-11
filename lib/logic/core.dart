import 'dart:async';
import 'dart:ffi';

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
  static void doStart() {
    _setTimerState(true);
  }

  static void doBreak() {
    _setTimerState(false);
    _resetTimer();
  }

  static bool _isNegative = false;
  static bool _isDivide = false;
  static bool _isFirst = true;
  static int _aNum = 0;
  static int _bNum = 0;

  static String answer = "    ";

  static String getButtonText(int index) {
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

  static void receiveButton(int index) {
    mathscreenStateFunc!(() {
      switch (index) {
        // (Clear)
        case -1:
          _clearReset();
          break;

        // (-)
        case 9:
          if (_isFirst && !_isNegative) {
            if (!_appendAnswer("-")) {
              break;
            }
            _isNegative = true;
          }
          break;

        // (0)
        case 10:
          if (!_appendAnswer("0")) {
            break;
          }
          _addNum(0);
          break;

        // (/)
        case 11:
          if (!_isFirst && !_isDivide) {
            if (!_appendAnswer("/")) {
              break;
            }
            _isDivide = true;
          }
          break;

        // (1 2 .. 8 9)
        default:
          if (!_appendAnswer("${index + 1}")) {
            break;
          }
          _addNum(index + 1);
          break;
      }

      if (_aNum == 12 && !_isNegative) {
        _clearReset();
        _resetTimer();
      }
    });
  }

  static void _clearReset() {
    _isNegative = false;
    _isDivide = false;
    _isFirst = true;
    _aNum = 0;
    _bNum = 0;

    answer = "    ";
  }

  static bool _appendAnswer(String s) {
    String trim = answer.trim();
    if (answer != trim) {
      print("hehe");
      answer = (trim + s).padRight(answer.length);
      return true;
    }
    return false;
  }

  static void _addNum(int n) {
    _isFirst = false;
    if (_isDivide) {
      _bNum *= 10;
      _bNum += n;
    } else {
      _aNum *= 10;
      _aNum += n;
    }
  }
}
