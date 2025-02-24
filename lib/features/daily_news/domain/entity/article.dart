import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable{

  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({

    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content, 
    String? source,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];

}