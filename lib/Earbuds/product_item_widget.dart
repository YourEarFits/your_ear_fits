import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // 이미지
      leading: Image.network(product['image_src']),
      // 제목
      title: Text(product['name']),
      // 부제목
      subtitle: Text(product['specs']),
    );
  }
}
