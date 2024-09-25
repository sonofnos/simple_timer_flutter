import 'dart:async';

import 'package:flutter/material.dart';

class TimerHome extends StatefulWidget {
  const TimerHome({super.key});

  @override
  State<TimerHome> createState() => _TimerHomeState();
}

class _TimerHomeState extends State<TimerHome> {
  int _seconds = 0;
  Timer? _timer;
  bool _isRunning = false;

  void _startTimer() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _isRunning = true;
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 0;
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Basic Timer',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _formatTime(_seconds),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: !_isRunning,
                  child: ElevatedButton(
                    onPressed: _startTimer,
                    child: const Text('Start'),
                  ),
                ),
                Visibility(
                  visible: _isRunning,
                  child: ElevatedButton(
                    onPressed: _stopTimer,
                    child: const Text('Stop'),
                  ),
                ),
                const SizedBox(width: 20),
                Visibility(
                  visible: _seconds > 0,
                  child: ElevatedButton(
                    onPressed: _resetTimer,
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
