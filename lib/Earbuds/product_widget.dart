import 'package:flutter/material.dart';

import 'product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.productMap,
  });

  final Map<String, dynamic> productMap;

  String displayPrice(ProductModel productModel) {
    // '정품'이 포함된 요소를 찾습니다.
    final priceItem = productModel.price.firstWhere(
      (item) => item[0] == '정품',
      orElse: () => null, // '정품'이 없을 경우 null 반환
    );

    if (priceItem != null) {
      // '정품'이 있을 경우 그 가격을 반환합니다.
      return priceItem[1] + ' 원';
    } else if (productModel.price.length == 1) {
      // 가격 리스트에 하나의 항목만 있는 경우 그 가격을 반환합니다.
      return productModel.price[0][1] + ' 원';
    } else if (productModel.price.isNotEmpty) {
      // '정품'이 없고 여러 가격이 있는 경우, 모든 모델과 가격을 반환합니다.
      String result = '';
      for (var i in productModel.price) {
        // 마지막 요소인 경우 줄바꿈 없이 출력
        if (i[0] == productModel.price[productModel.price.length - 1][0]) {
          result += '${i[0]}: ${i[1]} 원';
        } else {
          result += '${i[0]}: ${i[1]} 원\n';
        }
      }
      return result;
    } else {
      // 가격 리스트가 비어 있을 경우
      return '가격 정보 없음';
    }
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
                Text(displayPrice(productModel),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
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
