import 'package:firebase_auth/firebase_auth.dart';

class Logout{
  static Future<void> logout() async {
    // Firebase Auth 로그아웃
    await FirebaseAuth.instance.signOut();
  }
}