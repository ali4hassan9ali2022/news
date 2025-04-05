import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/News_cubit/business_state.dart';
import 'package:news/repo/news_repo.dart';

class BusinessCubit extends Cubit<BusinessState> {
  final NewsRepo newsRepo;
  BusinessCubit({required this.newsRepo}) : super(InitialBusinessState());

  Future<void> fetchBusines() async {
    emit(LoadingBusinessState());
    var result = await newsRepo.getBusiness();
    result.fold(
      (failur) {
        return emit(FailureBusinessState(errMessage: failur.errMessage));
      },
      (articles) {
        return emit(SuccessBusinessState(business: articles));
      },
    );
  }

 
}
