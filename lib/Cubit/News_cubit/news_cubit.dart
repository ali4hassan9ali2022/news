import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/News_cubit/news_state.dart';
import 'package:news/repo/news_repo.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo newsRepo;
  NewsCubit({required this.newsRepo}) : super(InitialBusinessState());

  Future<void> getBusines() async {
    emit(LoadingBusinessState());
    var result = await newsRepo.getBusiness();
    result.fold(
      (failur) {
        return emit(FailureBusinessState(errMessage: failur.errMessage));
      },
      (articles) {
        return emit(SuccessBusinessState(articlesModel: articles));
      },
    );
  }
}
