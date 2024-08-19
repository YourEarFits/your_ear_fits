class EarbudsModel {
  int id;
  String imageSrc;
  String name;
  String headline;
  String specs;
  String releaseDate;
  int reviewCount;
  dynamic starScore;
  String link;
  List<dynamic> price;

  /// 이어폰 모델 생성자
  EarbudsModel({
    required this.id,
    required this.imageSrc,
    required this.name,
    required this.headline,
    required this.specs,
    required this.releaseDate,
    required this.reviewCount,
    required this.starScore,
    required this.link,
    required this.price,
  });

  /// JSON 데이터를 이어폰 모델로 변환하는 팩토리 생성자
  factory EarbudsModel.fromJson(Map<String, dynamic> json) {
    return EarbudsModel(
      id: json['id'],
      imageSrc: json['image_src'],
      name: json['name'],
      headline: json['headline'],
      specs: json['specs'],
      releaseDate: json['release_date'],
      reviewCount: json['review_count'],
      starScore: json['star_score'],
      link: json['link'],
      price: json['price'],
    );
  }
}
