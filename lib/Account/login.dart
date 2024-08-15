import 'package:supabase_flutter/supabase_flutter.dart';

class Login {
  static Future<bool> login(
    String email,
    String password,
  ) async {
    // 로그인
    try {
      await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);
      return true; // 로그인 성공 시
    } catch (e) {
      rethrow; // 에러 발생 시 에러 반환
    }
  }
}
