class ArticlesModel {
  final String? image;
  final String title;
  final String url;
  final DateTime publishedAt;
  const ArticlesModel({
    required this.url,
    required this.image,
    required this.title,
    required this.publishedAt,
  });
  factory ArticlesModel.fromJson(json) {
    return ArticlesModel(
      url: json["url"] ?? "",
      image: json["urlToImage"],
      title: json["title"],
      publishedAt: DateTime.parse(json["publishedAt"]),
    );
  }
}
