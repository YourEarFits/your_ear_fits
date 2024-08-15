import 'package:flutter/material.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_screen.dart';
import 'package:your_ear_fits/Earbuds/search_screen.dart';
import 'package:your_ear_fits/navigator_widget.dart';
import 'package:your_ear_fits/ear_test_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Your Ear Fits',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlue),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    // 버튼 클릭 시 검색 화면으로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: '이어폰을 검색하세요!',
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                            icon: const Icon(Icons.person_search_rounded,
                                size: 50),
                          ),
                          const Text("귀 모양 검사")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EarbudsListScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.search, size: 50),
                          ),
                          const Text("이어폰 보러가기"),
                        ],
                      ),
                    ],
                  ),
                  // 하단 여백을 위한 SizedBox
                  const SizedBox(height: 250),
                ],
              ),
              const NavigatorWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
