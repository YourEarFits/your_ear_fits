import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_ear_fits/Earbuds/product_widget.dart';

class EarbudsListScreen extends StatelessWidget {
  const EarbudsListScreen({super.key});

  Future<List<Map<String, dynamic>>> _getEarbudsList() async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('products').select();

    return data;
  }

  @override
  Widget build(BuildContext context) {
    _getEarbudsList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('이어폰 목록'),
      ),
      backgroundColor: Colors.white,
      body: Expanded(
        child: FutureBuilder(
          future: _getEarbudsList(),
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
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductWidget(productMap: product));
                },
              );
            }
          },
        ),
      ),
    );
  }
}
