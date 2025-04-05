import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/App_cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super (IntialAppState());

  int currentIndex = 0;
  List<String> titles = [
    "",
    "",
    "",
    "",
  ];
}