import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_view.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_view_model.dart';
import 'package:your_ear_fits/Earbuds/search_view.dart';
import 'package:your_ear_fits/navigator_widget.dart';
import 'package:your_ear_fits/ear_test_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        // 상단 앱바
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
        // 홈 화면
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                // 버튼 클릭 시 검색 화면으로 이동
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchView(),
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
                      // 귀 모양 검사
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
                      // 이어폰 보러가기
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              // 이어폰 뷰 모델을 가져와서
                              // 이어폰 리스트를 불러온 후
                              // 이어폰 리스트 화면으로 이동
                              context
                                  .read<EarbudsListViewModel>()
                                  .loadEarbudsList()
                                  .then((_) {
                                if (context.mounted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EarbudsListView(),
                                    ),
                                  );
                                }
                              });
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
