import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_view_model.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_view.dart';

class SearchView extends StatefulWidget {
  /// 이어폰 검색 화면
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  // 텍스트 필드 컨트롤러
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('이어폰 검색하세요!'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                // 텍스트 필드 컨트롤러를 지정
                controller: searchController,
                autofocus: true, // 자동으로 포커스를 줌
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: '이어폰을 검색하세요!',
                ),

                // 검색어를 입력하고 엔터를 누르면 검색 결과 화면으로 이동
                onSubmitted: (value) {
                  // 이어폰 뷰 모델을 가져와서
                  // 검색어를 전달
                  // 검색 결과 화면으로 이동
                  context
                      .read<EarbudsListViewModel>()
                      .loadEarbudsList(searchValue: value)
                      .then((_) {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EarbudsListView(),
                        ),
                      );
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
