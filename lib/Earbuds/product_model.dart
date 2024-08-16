class ProductModel {
  int id;
  String imageSrc;
  String name;
  String headline;
  String specs;
  String releaseDate;
  int reviewCount;
  dynamic starScore;
  String link;
  List price;

  ProductModel(Map<String, dynamic> productMap)
      : id = productMap['id'],
        imageSrc = productMap['image_src'],
        name = productMap['name'],
        headline = productMap['headline'],
        specs = productMap['specs'],
        releaseDate = productMap['release_date'],
        reviewCount = productMap['review_count'],
        starScore = productMap['star_score'],
        link = productMap['link'],
        price = productMap['price'];
}
