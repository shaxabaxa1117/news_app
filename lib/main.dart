import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/theme/app_themes.dart';
import 'package:news_app/features/daily_news/presentation/blocs/article/remote/bloc/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/pages/daily_news_page.dart';
import 'package:news_app/injection_container.dart';

void main() async {
  initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticleBloc>(create: (context) => sl()..add(const GetArticles())),
        // BlocProvider(create: (context) => SubjectBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: DailyNewsPage(),
      ),
    );
  }
}
