import 'package:news/Models/articles_model.dart';

abstract class SearchState {}

class InitialSearchState extends SearchState{}
class LoadingSearchState extends SearchState{}
class FailureSearchState extends SearchState{
  final String errMessage;

  FailureSearchState(this.errMessage);
}
class SuccessSearchState extends SearchState{
  final List<ArticlesModel> search;

  SuccessSearchState(this.search);
}