import 'package:news/Models/articles_model.dart';

abstract class BusinessState {}

class InitialBusinessState extends BusinessState {}

class LoadingBusinessState extends BusinessState {}

class SuccessBusinessState extends BusinessState {
  final List<ArticlesModel> business;

  SuccessBusinessState({required this.business});
}

class FailureBusinessState extends BusinessState {
  final String errMessage;

  FailureBusinessState({required this.errMessage});
}
