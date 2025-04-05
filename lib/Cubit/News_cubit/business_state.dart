import 'package:news/Models/articles_model.dart';

abstract class NewsState {}

class InitialBusinessState extends NewsState {}

class LoadingBusinessState extends NewsState {}

class SuccessBusinessState extends NewsState {
  final List<ArticlesModel> business;

  SuccessBusinessState({required this.business});
}

class FailureBusinessState extends NewsState {
  final String errMessage;

  FailureBusinessState({required this.errMessage});
}

// class LoadingSportsState extends NewsState {}

// class SuccessSportsState extends NewsState {
//   final List<ArticlesModel> sports;

//   SuccessSportsState({required this.sports});
// }

// class FailureSportsState extends NewsState {
//   final String errMessage;

//   FailureSportsState({required this.errMessage});
// }
