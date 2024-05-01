import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/home_page.dart';
import 'package:digital_wind_application/pages/library_page.dart';
import 'package:digital_wind_application/pages/main_page.dart';
import 'package:digital_wind_application/pages/profile_page.dart';
import 'package:digital_wind_application/pages/shop_page.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/login_page.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/registration_agreement_page.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/registration_continue.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/registration_page.dart';
import 'package:digital_wind_application/pages/subpages/avatar_editor.dart';
import 'package:digital_wind_application/pages/testslist_page.dart';
import 'package:digital_wind_application/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:phone_form_field/phone_form_field.dart';

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
            AutoRoute(path: '', page: LoginRoute.page, initial: true),
            AutoRoute(
              path: '',
              page: MainRoute.page,
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
            AutoRoute(
              path: '',
              page: ProfileRoute.page,
            ),
            AutoRoute(
              path: '',
              page: Testing.page,
            ),
            AutoRoute(
              path: '',
              page: ShopRoute.page,
            ),
            AutoRoute(
              path: '',
              page: LibraryRoute.page,
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
