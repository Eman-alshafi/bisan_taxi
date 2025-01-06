import 'package:flutter/material.dart';
import 'package:taxiapp/mainscreens/fscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: fscreen(),
    );
  }
}
