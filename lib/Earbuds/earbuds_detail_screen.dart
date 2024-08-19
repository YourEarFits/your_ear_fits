import 'package:flutter/material.dart';
import 'product_model.dart';

class EarbudsDetailScreen extends StatelessWidget {
  final ProductModel product;

  const EarbudsDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name), // AppBar에 이어폰 이름 표시
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // 스크롤 가능하게 함
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이어폰 이미지
                    Center(
                      child: Image.network(product.imageSrc),
                    ),
                    const SizedBox(height: 16),
                    // 이어폰 이름
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 이어폰 가격
                    Text(
                      '가격: ${product.price.join(", ")} 원',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 이어폰 스펙
                    Text(
                      '스펙: ${product.specs}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 100), // 버튼 공간 확보를 위해 여유 공간 추가
                  ],
                ),
              ),
            ),
          ),
          // 구매하기 버튼
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -2),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                // 여기에 구매하기 버튼 눌렀을 때 동작 추가
              },
              child: const Text(
                '구매하기',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
