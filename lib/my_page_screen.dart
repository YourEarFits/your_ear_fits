import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_ear_fits/Account/login_screen.dart';
import 'package:your_ear_fits/Account/logout_widget.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('마이페이지'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: Supabase.instance.client.auth.onAuthStateChange,
              builder: (context, snapshot) {
                // 로그인 상태인 경우
                if (snapshot.data?.session?.user.id != null) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // 사용자 식별번호
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('사용자 식별번호'),
                                  Text(snapshot.data!.session!.user.id),
                                ],
                              ),
                            ),
                            // 이메일 주소
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const Text('이메일 주소'),
                                  Text("${snapshot.data!.session!.user.email}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // 전화번호
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('전화번호'),
                                  Text(
                                      snapshot.data!.session!.user.phone ?? ''),
                                ],
                              ),
                            ),
                            // 마지막 로그인
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const Text('마지막 로그인'),
                                  Text(
                                      "${snapshot.data!.session!.user.lastSignInAt}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text('로그인 상태입니다.'),
                        const LogoutWidget(),
                      ],
                    ),
                  );
                } else {
                  // 로그인 상태가 아닌 경우
                  return Column(
                    children: [
                      const Text('로그인이 필요합니다.'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('로그인'),
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
