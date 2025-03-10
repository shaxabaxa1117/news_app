
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_sourses/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{

final NewsApiService _newsApiService;

ArticleRepositoryImpl(this._newsApiService);

  @override //! implemetation
  Future<DataState<List<ArticleModel>>> getNewsArticles() async{

try{
   final httpResponse = await _newsApiService.getNewsArticles(
    apiKey: apiKey,
    category: categoryQuery,
    country: countryQuery,
   );

   if(httpResponse.response.statusCode == HttpStatus.ok){
    
    return DataSuccess(httpResponse.data);

    
   }else{
    return DataFailed(
      DioException(error: httpResponse.response.statusMessage,
      response: httpResponse.response,
      type: DioExceptionType.badResponse,
      requestOptions: httpResponse.response.requestOptions)
    );
   }
  } on DioException catch(e){
    return DataFailed(e);
  }
  
  } 
}