import 'dart:async';

import 'package:flutter/material.dart';
import 'package:your_ear_fits/Account/login.dart';
import 'package:your_ear_fits/Account/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final StreamController<String> _loginMessageController =
      StreamController<String>();

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    Login.login(email, password).then((value) {
      if (value) {
        print('Login 성공');
        Navigator.pop(context);
      }
    }).catchError((onError) {
      print('Login 실패: $onError');
      _loginMessageController.add(onError.toString());
    });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text('Sign Up'))
              ],
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
