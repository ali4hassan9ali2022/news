import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/Search_cubit/search_state.dart';
import 'package:news/repo/news_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  final NewsRepo newsRepo;
  SearchCubit(this.newsRepo) : super(InitialSearchState());

  TextEditingController controller = TextEditingController();
   Future<void> fetchSearch({required String? value}) async {
    emit(LoadingSearchState());
    if (value != null) {
      var result = await newsRepo.getSearch(value: value);
    result.fold(
      (failur) {
        return emit(FailureSearchState(failur.errMessage));
      },
      (articles) {
        return emit(SuccessSearchState(articles));
      },
    );
    } else {
      emit(FailureSearchState("Invalid response data"));
    }
  }

}