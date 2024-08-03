import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final StreamController<String> _loginMessageController = StreamController<String>();

  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    print('Email: $email, Password: $password');
    // Firebase Auth 로그인 로직
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential value) {
      print('Login Success: ${value.user!.uid}');
      Navigator.pop(context);
    }).catchError((e) {
      print('Login Failed: $e');
      _loginMessageController.add(e.toString());
    });

    // 로그인 성공 확인 (테스트 코드)
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print('Login Success: ${user.uid}');
    } else {
      print('Login Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook_outlined),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone_android_outlined),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outlined),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outlined),
                  iconSize: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
