import 'package:flutter/material.dart';

import 'timer_home.dart';

void main() {
  runApp(const SimpleTimerApp());
}

class SimpleTimerApp extends StatelessWidget {
  const SimpleTimerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TimerHome(),
    );
  }
}
