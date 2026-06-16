import 'package:blogger/app/routes/app_paths.dart';
import 'package:blogger/features/auth/presentation/signin/signin_screen.dart';
import 'package:blogger/features/splash/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: AppPaths.splash,
        builder: (context, state) => const SigninScreen(),
      ),

      //tODO: add auth and home routes
    ],
  );
}
