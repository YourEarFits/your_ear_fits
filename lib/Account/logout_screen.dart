import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Firebase Auth 로그아웃
        FirebaseAuth.instance.signOut();
      },
      child: const Text(
        'Logout',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
