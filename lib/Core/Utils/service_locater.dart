
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/Core/Api/api_service.dart';
import 'package:news/repo/news_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocater() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<NewsRepoImpl>(NewsRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));
}
