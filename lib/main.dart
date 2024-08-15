import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_ear_fits/firebase_options.dart';
import 'package:your_ear_fits/home_screen.dart';

Future<void> main() async {
  // 앱이 초기화되었다고 가정하고 실행
  WidgetsFlutterBinding.ensureInitialized();

  // .env 파일 로드
  await dotenv.load();
  
  // Supabase 초기화
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  // Firebase 초기화
  await FirebaseInit.init();

  // 앱 실행
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class FirebaseInit {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Firebase Auth 상태 변화 감지
    firebase_auth.FirebaseAuth.instance.authStateChanges().listen((firebase_auth.User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
