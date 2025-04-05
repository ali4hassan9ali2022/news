import 'package:news/Models/articles_model.dart';

abstract class SciencesState {}
class InitialSciencesState extends SciencesState {}
class LoadingSciencesState extends SciencesState {}

class SuccessSciencesState extends SciencesState {
  final List<ArticlesModel> sciences;

  SuccessSciencesState({required this.sciences});
}

class FailureSciencesState extends SciencesState {
  final String errMessage;

  FailureSciencesState({required this.errMessage});
}