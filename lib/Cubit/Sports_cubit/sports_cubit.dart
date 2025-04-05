import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/Sports_cubit/sports_state..dart';
import 'package:news/repo/news_repo.dart';

class SportsCubit extends Cubit<SportsState> {
  final NewsRepo newsRepo;
  SportsCubit(this.newsRepo) : super(InitialSportsState());
  Future<void> fetchSports() async {
    emit(LoadingSportsState());
    var result = await newsRepo.getSports();
    result.fold(
      (failur) {
        return emit(FailureSportsState(errMessage: failur.errMessage));
      },
      (articles) {
        return emit(SuccessSportsState(sports: articles));
      },
    );
  }
}