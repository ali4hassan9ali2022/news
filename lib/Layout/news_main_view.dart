import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Api/api_service.dart';
import 'package:news/Core/Widgets/custom_app_bar.dart';
import 'package:news/Cubit/App_cubit/app_cubit.dart';
import 'package:news/Cubit/App_cubit/app_state.dart';
import 'package:news/Cubit/News_cubit/news_cubit.dart';
import 'package:news/repo/news_repo_impl.dart';

class NewsMainView extends StatelessWidget {
  const NewsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocProvider(
          create:
              (context) => NewsCubit(
                newsRepo: NewsRepoImpl(apiService: ApiService(Dio())),
              ),
          child: Scaffold(
            appBar: CustomAppBar(cubit: cubit),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.icons,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeBottomNavBar(value);
              },
            ),
            body: PageView.builder(
              onPageChanged: (value) {
                cubit.changePageView(value);
              },
              controller: cubit.pageController,
              itemCount: cubit.pages.length,
              itemBuilder: (context, index) {
                return cubit.pages[cubit.currentIndex];
              },
            ),
          ),
        );
      },
    );
  }
}
