import 'package:go_router/go_router.dart';
import 'package:news/Layout/news_main_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const NewsMainView()),
    ],
  );
}
