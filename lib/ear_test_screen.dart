import 'package:flutter/material.dart';

class EarTestScreen extends StatelessWidget {
  const EarTestScreen({super.key});
  // 귀 검사 페이지
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('귀 검사'),
      ),
        backgroundColor: const Color(0xFFFAFAFA),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }
}