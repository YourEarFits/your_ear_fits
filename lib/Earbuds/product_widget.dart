import 'package:flutter/material.dart';

import 'product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.productMap,
  });

  final Map<String, dynamic> productMap;

  Widget displayPrice(ProductModel productModel) {
    // 가격 정보가 없는 경우
    if (productModel.price.isEmpty) {
      return const Column(
        children: [
          Text(
            '가격 정보 없음',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }
    // 가격 정보가 하나만 있는 경우
    else if (productModel.price.length == 1) {
      for (var i in productModel.price) {
        return Column(
          children: [
            Text(
              '${i[1]} 원',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }
    }
    // 가격 정보에 '정품'이 포함된 경우
    else if (productModel.price.any((i) => i[0] == '정품')) {
      for (var i in productModel.price) {
        if (i[0] == '정품') {
          return Column(
            children: [
              Text(
                '${i[1]} 원',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        }
      }
    }
    // 가격 정보에 '정품'이 포함되지 않은 경우
    else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i in productModel.price)
            Text(
              '${i[0]}: ${i[1]} 원',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      );
    }
    return const Column();
  }

  String displaySpecs(ProductModel productModel) {
    // 스펙이 75자 이상인 경우 75자까지만 표시하고 '...'을 붙입니다.
    if (productModel.specs.length > 75) {
      return '${productModel.specs.substring(0, 75)}...';
    } else {
      return productModel.specs;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProductModel productModel = ProductModel(productMap);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA), // 배경색 설정
        border: Border.all(
          color: Colors.grey, // 테두리 색상
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          // 이미지
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // 테두리 색상
                    width: 0.25,
                  ),
                ),
                child: Image.network(productModel.imageSrc),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상품 이름
                Text(
                  productModel.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // 상품 가격
                displayPrice(productModel),
                // 상품 스펙
                Text(
                  displaySpecs(productModel),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
