import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // 텍스트 필드 컨트롤러
  TextEditingController searchController = TextEditingController();

  // 검색 결과를 저장할 변수
  Future<List<Map<String, dynamic>>>? searchResults;

  Future<List<Map<String, dynamic>>> _getEarbudsList(String search) async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('products').select().or(
        'name.ilike.%$search%,headline.ilike.%$search%,specs.ilike.%$search%,release_date.ilike.%$search%');

    return data;
  }

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
                onSubmitted: (value) {
                  // 검색어를 입력하고 엔터를 누르면 검색 결과 화면으로 이동
                  setState(() {
                    searchResults = _getEarbudsList(searchController.text);
                  });
                },
              ),
            ),
            // 검색 결과를 표시할 위젯(결과는 searchResults 변수에 저장됨)
            EarbudsListWidget(searchResults: searchResults),
          ],
        ),
      ),
    );
  }
}
