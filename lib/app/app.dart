import 'package:blogger/app/routes/app_routes.dart';
import 'package:blogger/core/theme/app_theme.dart';
import 'package:blogger/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
    );
  }
}
