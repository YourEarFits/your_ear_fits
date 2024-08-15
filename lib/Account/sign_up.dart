import 'package:supabase_flutter/supabase_flutter.dart';

class SignUp {
  static Future<bool> signUp(
    String email,
    String password,
  ) async {
    // 회원가입
    try {
      await Supabase.instance.client.auth
          .signUp(email: email, password: password);
      return true; // 성공 시
    } catch (e) {
      rethrow; // 에러 발생 시 에러 반환
    }
  }
}
