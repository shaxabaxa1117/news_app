import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;

  const ArticleWidget({
    super.key,
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:
                  urlToImage != null && urlToImage!.isNotEmpty
                      ? Image.network(
                        urlToImage!,
                        height: 250, // Увеличил высоту изображения
                        width: double.infinity, // Растягиваем на всю ширину
                        fit: BoxFit.cover, // Правильное масштабирование
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 250,
                            width: double.infinity,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                                size: 80, // Увеличил иконку
                              ),
                            ),
                          );
                        },
                      )
                      : Container(
                        height: 250,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 80,
                          ),
                        ),
                      ),
            ),
            const SizedBox(height: 12.0),
            Text(
              title ?? 'Без заголовка',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Text(
              description ?? 'Описание отсутствует',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Text(
              publishedAt ?? 'Дата неизвестна',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
            if (author != null && author!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Автор: $author',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
