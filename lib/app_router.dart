import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/home_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRootRouter.page,
          initial: true,
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
              initial: true,
            ),
          ],
        ),
      ];
}

class AppAutoRouter extends StatefulWidget {
  const AppAutoRouter({super.key});

  @override
  State<AppAutoRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppAutoRouter> {
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(includePrefixMatches: true),
    );
  }
}
