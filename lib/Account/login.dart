import 'package:supabase_flutter/supabase_flutter.dart';

class Login {
  static Future<bool> login(
    String email,
    String password,
  ) async {
    // 로그인 함수

    try {
      // 로그인 로직
      await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);
      return true; // 로그인 성공 시 true 반환
    } catch (e) {
      rethrow; // 에러 발생 시 에러 반환
    }
  }
}
