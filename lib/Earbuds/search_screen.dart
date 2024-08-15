import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'product_item_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
        title: const Text('이어폰 검색하세요!'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                autofocus: true, // 자동으로 포커스를 줌
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: '이어폰을 검색하세요!',
                ),
                onSubmitted: (value) {
                  // 검색어를 입력하고 엔터를 누르면 검색 결과 화면으로 이동
                  setState(() {
                    searchResults = _getEarbudsList(value);
                  });
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: searchResults,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('오류: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('검색 결과가 없습니다.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return ProductItemWidget(product: product);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
