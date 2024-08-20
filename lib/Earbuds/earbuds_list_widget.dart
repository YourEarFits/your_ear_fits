import 'package:flutter/material.dart';
import 'package:your_ear_fits/Earbuds/product_widget.dart';
import 'package:your_ear_fits/Earbuds/earbuds_detail_screen.dart';
import 'package:your_ear_fits/Earbuds/product_model.dart';

class EarbudsListWidget extends StatelessWidget {
  final Future<List<Map<String, dynamic>>>? searchResults;

  const EarbudsListWidget({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                final productMap =
                    snapshot.data![index] as Map<String, dynamic>;
                final productModel = ProductModel(productMap);

                return GestureDetector(
                  // 터치 이벤트를 감지하는 GestureDetector 추가
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EarbudsDetailScreen(
                            product: productModel), // 페이지 이동
                      ),
                    );
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductWidget(productMap: productMap),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
