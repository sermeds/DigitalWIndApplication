import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/home_page.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/login_page.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/registration_agreement_page.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/registration_continue.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/registration_page.dart';
import 'package:digital_wind_application/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
              page: LoginRoute.page,
              initial: true,
            ),
            AutoRoute(
              path: '',
              page: RegistrationRoute.page,
            ),
            AutoRoute(
              path: '',
              page: RegistrationAgreementRoute.page,
            ),
            AutoRoute(
              path: '',
              page: RegistrationContinueRoute.page,
            ),
            AutoRoute(
              path: '',
              page: HomeRoute.page,
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
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: _router.config(includePrefixMatches: true),
        );
      },
    );
  }
}
