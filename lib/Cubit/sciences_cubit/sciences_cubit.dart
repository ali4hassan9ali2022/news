import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/sciences_cubit/sciences_state.dart';
import 'package:news/repo/news_repo.dart';

class SciencesCubit extends Cubit<SciencesState> {
  final NewsRepo newsRepo;
  SciencesCubit(this.newsRepo) : super(InitialSciencesState());
  Future<void> fetchSciences() async {
    emit(LoadingSciencesState());
    var result = await newsRepo.getSciences();
    result.fold(
      (failur) {
        return emit(FailureSciencesState(errMessage: failur.errMessage));
      },
      (articles) {
        return emit(SuccessSciencesState(sciences: articles));
      },
    );
  }
}