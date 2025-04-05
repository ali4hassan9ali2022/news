import 'package:dartz/dartz.dart';
import 'package:news/Core/errors/failure.dart';
import 'package:news/Models/articles_model.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<ArticlesModel>>> getBusiness();
  Future<Either<Failure, List<ArticlesModel>>> getSports();
  Future<Either<Failure, List<ArticlesModel>>> getSciences();
  Future<Either<Failure, List<ArticlesModel>>> getHealths();
  Future<Either<Failure, List<ArticlesModel>>> getSearch({
    required String value,
  });
}
