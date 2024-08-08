import 'package:flutter/material.dart';

class EventPageScreen extends StatelessWidget {
  const EventPageScreen({super.key}); // Added semicolon

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: const Text('이벤트'),
    ),
    backgroundColor: Colors.white,
    body: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text("이벤트가 없습니다."),
          ),
        ],
      ),
    ),
  );
}