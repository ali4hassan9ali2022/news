import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/Search_cubit/search_state.dart';
import 'package:news/repo/news_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  final NewsRepo newsRepo;
  SearchCubit(this.newsRepo) : super(InitialSearchState());

  TextEditingController controller = TextEditingController();
   Future<void> fetchSearch() async {
    emit(LoadingSearchState());
    var result = await newsRepo.getSciences();
    result.fold(
      (failur) {
        return emit(FailureSearchState(failur.errMessage));
      },
      (articles) {
        return emit(SuccessSearchState(articles));
      },
    );
  }

}