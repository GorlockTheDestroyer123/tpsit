import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final StreamController<int> _tickController = StreamController<int>();
  late StreamSubscription<int> _tickSubscription;
  int _elapsedSeconds = 0;
  bool _isPaused = false;

  _TimerScreenState() {
    _tickSubscription = _tickController.stream.listen((tick) {
      if (!_isPaused) {
        setState(() {
          _elapsedSeconds = tick;
        });
      }
    });

    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _tickController.sink.add(_elapsedSeconds + 1);
    });
  }

  void pauseTimer() {
    setState(() {
      _isPaused = true;
    });
  }

  void resumeTimer() {
    setState(() {
      _isPaused = false;
    });
  }

  void resetTimer() {
    setState(() {
      _elapsedSeconds = 0;
    });
  }

  @override
  void dispose() {
    _tickSubscription.cancel();
    _tickController.close();
    super.dispose();
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer / Cronometro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tempo trascorso:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              formatTime(_elapsedSeconds),
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pauseTimer,
                  child: Text('Pausa'),
                ),
                ElevatedButton(
                  onPressed: resumeTimer,
                  child: Text('Riprendi'),
                ),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}