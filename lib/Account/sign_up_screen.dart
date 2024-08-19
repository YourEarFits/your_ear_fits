import 'dart:async';

import 'package:flutter/material.dart';
import 'package:your_ear_fits/Account/sign_up.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final StreamController<String> _loginMessageController =
      StreamController<String>();

  void pressedSignUp() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    SignUp.signUp(email, password).then((value) {
      if (value) {
        // 성공
        Navigator.pop(context); // 회원가입 성공 시 로그인 화면으로 이동
        Navigator.pop(context); // 마이페이지로 이동
      }
    }).catchError((onError) {
      // 실패
      _loginMessageController.add(onError.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이메일 주소',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            StreamBuilder(
              stream: _loginMessageController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data}");
                }
                return const SizedBox();
              },
            ),
            ElevatedButton(
              onPressed: pressedSignUp,
              child: const Text(
                '회원가입',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
