import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Cache/cache_helper.dart';
import 'package:news/Core/Utils/app_router.dart';
import 'package:news/Core/Utils/service_locater.dart';
import 'package:news/Cubit/App_cubit/app_cubit.dart';
import 'package:news/Cubit/App_cubit/app_state.dart';
import 'package:news/Cubit/News_cubit/business_cubit.dart';
import 'package:news/Cubit/Search_cubit/search_cubit.dart';
import 'package:news/Cubit/Sports_cubit/sports_cubit.dart';
import 'package:news/Cubit/healths_cubit/healths_cubit.dart';
import 'package:news/Cubit/sciences_cubit/sciences_cubit.dart';
import 'package:news/Theme/theme_mode.dart';
import 'package:news/repo/news_repo_impl.dart';
import 'package:news/simple_bloc_opserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  Bloc.observer = SimpleBlocOpserver();
  setupServiceLocater();
  runApp(NewsApp(isDark: isDark));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.isDark});
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create:
              (context) =>
                  BusinessCubit(newsRepo: getIt.get<NewsRepoImpl>())
                    ..fetchBusines(),
        ),
        BlocProvider(
          create:
              (context) =>
                  SportsCubit(getIt.get<NewsRepoImpl>())..fetchSports(),
        ),
        BlocProvider(
          create:
              (context) =>
                  SciencesCubit(getIt.get<NewsRepoImpl>())..fetchSciences(),
        ),
        BlocProvider(
          create:
              (context) =>
                  HealthsCubit(getIt.get<NewsRepoImpl>())..fetchHealths(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<NewsRepoImpl>()),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          return MaterialApp.router(
            themeMode:
                BlocProvider.of<AppCubit>(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
            theme: lightMode(),
            darkTheme: darkTheme(),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
