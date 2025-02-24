
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';



@RestApi(baseUrl: newsApiUrl)
abstract class NewsApiService {

factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;


 @GET('/top-headlines')
Future<HttpResponse<List<ArticleModel>>> getNewsArticles( {
 
  @Query('country') String? country,
  @Query('category') String? category,
  @Query('apiKey') String? apiKey, //! parameters
});

 //! this is going to be implemented by the retrofin generator
}