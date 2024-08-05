import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_ear_fits/Account/login_screen.dart';
import 'package:your_ear_fits/Account/logout_screen.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('마이페이지'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로그인 상태에 따라 다른 위젯을 보여줍니다.
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Column(
                    children: [
                      const Text('로그인이 필요합니다.'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                        ),
                      ),
                    ],
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
    );
  }
}
