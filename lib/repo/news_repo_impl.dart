import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news/Core/Api/api_service.dart';
import 'package:news/Core/errors/failure.dart';
import 'package:news/Models/articles_model.dart';
import 'package:news/repo/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final ApiService apiService;

  NewsRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ArticlesModel>>> getBusiness() async {
    try {
      var response = await apiService.get(
        endPoint:
            "top-headlines?country=us&apiKey=038db3e6297343e2b9275ec42333a688&category=business",
      );
      List<dynamic> articles = response["articles"];
      List<ArticlesModel> articlesBusiness = [];
      for (var item in articles) {
        articlesBusiness.add(ArticlesModel.fromJson(item));
      }
      return right(articlesBusiness);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ArticlesModel>>> getHealths() async{
    try {
      var response = await apiService.get(
        endPoint:
            "top-headlines?country=us&apiKey=038db3e6297343e2b9275ec42333a688&category=health",
      );
      List<dynamic> articles = response["articles"];
      List<ArticlesModel> articlesBusiness = [];
      for (var item in articles) {
        articlesBusiness.add(ArticlesModel.fromJson(item));
      }
      return right(articlesBusiness);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ArticlesModel>>> getSciences() async{
        try {
      var response = await apiService.get(
        endPoint:
            "top-headlines?country=us&apiKey=038db3e6297343e2b9275ec42333a688&category=science",
      );
      List<dynamic> articles = response["articles"];
      List<ArticlesModel> articlesBusiness = [];
      for (var item in articles) {
        articlesBusiness.add(ArticlesModel.fromJson(item));
      }
      return right(articlesBusiness);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ArticlesModel>>> getSports() async{
    try {
      var response = await apiService.get(
        endPoint:
            "top-headlines?country=us&apiKey=038db3e6297343e2b9275ec42333a688&category=sports",
      );
      List<dynamic> articles = response["articles"];
      List<ArticlesModel> articlesBusiness = [];
      for (var item in articles) {
        articlesBusiness.add(ArticlesModel.fromJson(item));
      }
      return right(articlesBusiness);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
