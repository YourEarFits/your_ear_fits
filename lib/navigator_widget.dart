import 'package:flutter/material.dart';
import 'package:your_ear_fits/event_page_screen.dart';
import 'package:your_ear_fits/my_page_screen.dart';
import 'package:your_ear_fits/ear_test_screen.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventPageScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.event, size: 50),
            ),
            const Text('이벤트'),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 50),
            ),
            const Text('검색'),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home, size: 50),
            ),
            const Text('홈'),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EarTestScreen(),
                ),
                );
                },
              icon: const Icon(Icons.earbuds, size: 50),
            ),
            const Text('귀 검사'),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPageScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.account_circle, size: 50),
            ),
            const Text('마이페이지'),
          ],
        )
      ],
    );
  }
}
