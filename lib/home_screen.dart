import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_ear_fits/Account/Logout.dart';
import 'package:your_ear_fits/Account/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '메인화면입니다.',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              // 로그인 상태에 따라 다른 위젯을 보여줍니다.
              StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      Text(
                          'Logged In: ${FirebaseAuth.instance.currentUser!.uid}'),
                      const LogoutWidget(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
