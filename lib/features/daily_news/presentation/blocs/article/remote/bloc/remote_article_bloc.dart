import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entity/article.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit)  async{
    final dataState = await _getArticleUseCase();
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(RemoteArticlesDone( dataState.data!));
  }
  if (dataState is DataFailed) {


    print(dataState.error!.message);

    emit(RemoteArticlesError(dataState.error!));
    
  }
}
}