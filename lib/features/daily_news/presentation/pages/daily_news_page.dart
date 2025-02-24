import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/blocs/article/remote/bloc/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/components/article_widget.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _builBody());
  }
}

_buildAppBar() {
  return AppBar(title: Text('Daily News'));
}

Widget _builBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (context, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is RemoteArticlesLoading) {
        return const Center(child: Icon(Icons.error));
      }
      if (state is RemoteArticlesDone) {
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (context, index) {
            return ArticleWidget(
              author: state.articles![index].author,
              title: state.articles![index].title,
              description: state.articles![index].description,
              urlToImage: state.articles![index].urlToImage,
              publishedAt: state.articles![index].publishedAt,
            );
          },
        );
      }
      return Text('sdfsdfsdfd');
    },
  );
}
