import 'package:news/Models/articles_model.dart';

abstract class NewsState {}

class InitialBusinessState extends NewsState {}

class LoadingBusinessState extends NewsState {}

class SuccessBusinessState extends NewsState {
  final List<ArticlesModel> articlesModel;

  SuccessBusinessState({required this.articlesModel});
}

class FailureBusinessState extends NewsState {
  final String errMessage;

  FailureBusinessState({required this.errMessage});
}
