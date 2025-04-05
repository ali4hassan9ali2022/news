import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/healths_cubit/healths_state.dart';
import 'package:news/repo/news_repo.dart';

class HealthsCubit extends Cubit<HealthsState> {
  final NewsRepo newsRepo;
  HealthsCubit(this.newsRepo) : super(InitialHealthsState());
  Future<void> fetchSciences() async {
    emit(LoadingHealthsState());
    var result = await newsRepo.getHealths();
    result.fold(
      (failur) {
        return emit(FailureHealthsState(errMessage: failur.errMessage));
      },
      (articles) {
        return emit(SuccessHealthsState(health: articles));
      },
    );
  }
}