import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
(오류)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Text("Hello World!"),
      ),
    );
  }
}
