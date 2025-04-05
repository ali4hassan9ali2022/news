import 'package:dartz/dartz.dart';
import 'package:news/Core/errors/failure.dart';
import 'package:news/Models/articles_model.dart';

abstract class NewsRepo {
  Future<Either<Failure,ArticlesModel>> getBusiness();
  Future<Either<Failure,ArticlesModel>> getSports();
  Future<Either<Failure,ArticlesModel>> getSciences();
  Future<Either<Failure,ArticlesModel>> getHealths();
}