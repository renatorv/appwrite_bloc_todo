import 'package:appwrite_bloc_todo/core/routes/route_names.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/view/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
  ],
);
