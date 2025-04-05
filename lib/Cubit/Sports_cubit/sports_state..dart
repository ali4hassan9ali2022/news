import 'package:news/Models/articles_model.dart';

abstract class SportsState {}
class InitialSportsState extends SportsState {}
class LoadingSportsState extends SportsState {}

class SuccessSportsState extends SportsState {
  final List<ArticlesModel> sports;

  SuccessSportsState({required this.sports});
}

class FailureSportsState extends SportsState {
  final String errMessage;

  FailureSportsState({required this.errMessage});
}
