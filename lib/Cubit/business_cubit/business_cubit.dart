import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/business_cubit/business_state.dart';
import 'package:news/repo/news_repo.dart';

class BusinessCubit extends Cubit<BusinessState> {
  final NewsRepo newsRepo;
  BusinessCubit({required this.newsRepo}) : super(InitialBusinessState());

  Future<void> getBusines() async{
    emit(LoadingBusinessState());
    var result = await newsRepo.getBusiness();
    result.fold((failur) {
      return emit(FailureBusinessState(errMessage: failur.errMessage));
    }, (articles) {
      return emit(SuccessBusinessState(articlesModel: articles));
    },);
  }  
  }