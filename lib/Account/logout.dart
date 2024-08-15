import 'package:supabase_flutter/supabase_flutter.dart';

class Logout {
  static Future<void> logout() async {
    // 로그아웃
    await Supabase.instance.client.auth.signOut();
  }
}
