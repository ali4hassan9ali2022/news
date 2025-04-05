import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Utils/app_router.dart';
import 'package:news/Cubit/App_cubit/app_cubit.dart';
import 'package:news/Theme/theme_mode.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
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
