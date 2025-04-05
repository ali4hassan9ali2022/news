import 'package:go_router/go_router.dart';
import 'package:news/Layout/news_main_view.dart';
import 'package:news/Views/search_view.dart';

abstract class AppRouter {
  static const kSearchView  = "/SearchView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const NewsMainView()),
      GoRoute(path: kSearchView, builder: (context, state) => const SearchView()),
    ],
  );
}
