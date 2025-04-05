import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Utils/app_router.dart';
import 'package:news/Core/Utils/service_locater.dart';
import 'package:news/Cubit/App_cubit/app_cubit.dart';
import 'package:news/Cubit/News_cubit/business_cubit.dart';
import 'package:news/Theme/theme_mode.dart';
import 'package:news/repo/news_repo_impl.dart';
import 'package:news/simple_bloc_opserver.dart';

void main() {
  Bloc.observer = SimpleBlocOpserver();
  setupServiceLocater();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => BusinessCubit(newsRepo: getIt.get<NewsRepoImpl>())..fetchBusines(),)
      ],
      child: MaterialApp.router(
        themeMode: ThemeMode.dark,
        theme: lightMode(),
        darkTheme: darkTheme(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
