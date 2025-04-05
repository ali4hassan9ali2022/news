import 'package:news/Models/articles_model.dart';

abstract class HealthsState {}
class InitialHealthsState extends HealthsState {}
class LoadingHealthsState extends HealthsState {}

class SuccessHealthsState extends HealthsState {
  final List<ArticlesModel> health;

  SuccessHealthsState({required this.health});
}

class FailureHealthsState extends HealthsState {
  final String errMessage;

  FailureHealthsState({required this.errMessage});
}