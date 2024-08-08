import 'package:firebase_auth/firebase_auth.dart';

class SignUp {
  static Future<bool> signUp(
    String email,
    String password,
  ) async {
    // 회원가입 함수

    try {
      // Firebase Auth 회원가입 로직
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true; // 회원가입 성공 시 true 반환
    } catch (e) {
      rethrow; // 에러 발생 시 에러 반환
    }
  }
}
