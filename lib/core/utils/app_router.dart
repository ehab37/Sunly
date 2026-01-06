import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:sunly/views/home_view.dart';
import 'package:sunly/views/search_view.dart';
import 'package:sunly/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = "/homeView";
  static const kSearchView = "/searchView";

  static final router = GoRouter(
    observers: [GoTransition.observer],
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
