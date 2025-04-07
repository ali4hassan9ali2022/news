import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Cache/cache_helper.dart';
import 'package:news/Cubit/App_cubit/app_state.dart';
import 'package:news/Views/business_view.dart';
import 'package:news/Views/health_view.dart';
import 'package:news/Views/science_view.dart';
import 'package:news/Views/sport_view.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(IntialAppState()) {
    isDark = CacheHelper.getData(key: 'isDark') ?? false;
  }

  int currentIndex = 0;
  List<String> titles = ["Business", "Sports", "Science", "health"];
  List<Widget> pages = [
    const BusinessView(),
    const SportView(),
    const ScienceView(),
    const HealthView(),
  ];
  List<BottomNavigationBarItem> icons = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "business",
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
    const BottomNavigationBarItem(
      icon: Icon(Icons.health_and_safety),
      label: "health",
    ),
  ];
  PageController pageController = PageController();
  changeBottomNavBar(int index) {
    currentIndex = index;

    emit(ChangeBottomNavAppState());
  }

  changePageView(int index) {
    currentIndex = index;
    emit(ChangePageViewAppState());
  }

  void startLoading() => emit(WebViewLoadingAppState());
  void finishLoading() => emit(WebViewLoadedAppState());
  void errorLoading(String errMessage) => emit(WebViewErrorAppState(errMessage));

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeStates());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        print('app mode changed to $isDark');
        emit(AppChangeModeStates());
      });
    }
  }
}
