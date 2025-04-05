import 'package:news/Models/articles_model.dart';

abstract class BusinessState {}

class LoadingBusinessState extends BusinessState{}
class SuccessBusinessState extends BusinessState{
  final List<ArticlesModel> articlesModel;

  SuccessBusinessState({required this.articlesModel});
}
class FailureBusinessState extends BusinessState{
  final String errMessage;

  FailureBusinessState({required this.errMessage});
}