class ArticlesModel {
  final String? image;
  final String title;
  final DateTime publishedAt;
  const ArticlesModel({
    required this.image,
    required this.title,
    required this.publishedAt,
  });
  factory ArticlesModel.fromJson(json) {
    return ArticlesModel(
        image: json["urlToImage"],
        title: json["title"],
        publishedAt: DateTime.parse(json["publishedAt"]));
  }
}