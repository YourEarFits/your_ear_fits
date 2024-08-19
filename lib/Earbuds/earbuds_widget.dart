import 'package:flutter/material.dart';

import 'earbuds_model.dart';

class EarbudsWidget extends StatelessWidget {
  final EarbudsModel earbudsModel;

  /// 리스트에서 각 상품을 표시하는 위젯
  const EarbudsWidget({
    super.key,
    required this.earbudsModel,
  });

  /// 가격 정보를 표시합니다.
  Widget displayPrice() {
    // 가격 정보가 없는 경우
    if (earbudsModel.price.isEmpty) {
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
    else if (earbudsModel.price.length == 1) {
      for (var i in earbudsModel.price) {
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
    else if (earbudsModel.price.any((i) => i[0] == '정품')) {
      for (var i in earbudsModel.price) {
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
          for (var i in earbudsModel.price)
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

  /// 스펙이 75자 이상인 경우 75자까지만 표시하고 '...'을 붙입니다.
  String displaySpecs() {
    if (earbudsModel.specs.length > 75) {
      return '${earbudsModel.specs.substring(0, 75)}...';
    } else {
      return earbudsModel.specs;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: Image.network(earbudsModel.imageSrc),
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
                  earbudsModel.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // 상품 가격
                displayPrice(),
                // 상품 스펙
                Text(
                  displaySpecs(),
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
