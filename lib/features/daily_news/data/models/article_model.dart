import 'package:news_app/features/daily_news/domain/entity/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    String? source, // Добавил source
  }) : super(
         author: author,
         title: title,
         description: description,
         url: url,
         urlToImage: urlToImage,
         publishedAt: publishedAt,
         content: content,
         source: source, // Передаём source в родительский класс
       );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
      source: json['source']?['name'] as String?, // Парсим source.name
    );
  }
}
