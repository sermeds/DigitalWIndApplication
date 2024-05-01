// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AvatarEditorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AvatarEditorPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    HomeRootRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeRootPage(),
      );
    },
    LibraryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LibraryPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    RegistrationAgreementRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationAgreementRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegistrationAgreementPage(
          key: args.key,
          login: args.login,
          password: args.password,
          phone: args.phone,
        ),
      );
    },
    RegistrationContinueRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationContinueRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegistrationContinuePage(
          key: args.key,
          login: args.login,
          password: args.password,
          phone: args.phone,
        ),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationPage(),
      );
    },
    ShopRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShopPage(),
      );
    },
    Testing.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TestsList(),
      );
    },
  };
}

/// generated route for
/// [AvatarEditorPage]
class AvatarEditorRoute extends PageRouteInfo<void> {
  const AvatarEditorRoute({List<PageRouteInfo>? children})
      : super(
          AvatarEditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AvatarEditorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeRootPage]
class HomeRootRouter extends PageRouteInfo<void> {
  const HomeRootRouter({List<PageRouteInfo>? children})
      : super(
          HomeRootRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRootRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LibraryPage]
class LibraryRoute extends PageRouteInfo<void> {
  const LibraryRoute({List<PageRouteInfo>? children})
      : super(
          LibraryRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationAgreementPage]
class RegistrationAgreementRoute
    extends PageRouteInfo<RegistrationAgreementRouteArgs> {
  RegistrationAgreementRoute({
    Key? key,
    required String login,
    required String password,
    required PhoneNumber phone,
    List<PageRouteInfo>? children,
  }) : super(
          RegistrationAgreementRoute.name,
          args: RegistrationAgreementRouteArgs(
            key: key,
            login: login,
            password: password,
            phone: phone,
          ),
          initialChildren: children,
        );

  static const String name = 'RegistrationAgreementRoute';

  static const PageInfo<RegistrationAgreementRouteArgs> page =
      PageInfo<RegistrationAgreementRouteArgs>(name);
}

class RegistrationAgreementRouteArgs {
  const RegistrationAgreementRouteArgs({
    this.key,
    required this.login,
    required this.password,
    required this.phone,
  });

  final Key? key;

  final String login;

  final String password;

  final PhoneNumber phone;

  @override
  String toString() {
    return 'RegistrationAgreementRouteArgs{key: $key, login: $login, password: $password, phone: $phone}';
  }
}

/// generated route for
/// [RegistrationContinuePage]
class RegistrationContinueRoute
    extends PageRouteInfo<RegistrationContinueRouteArgs> {
  RegistrationContinueRoute({
    Key? key,
    required String login,
    required String password,
    required PhoneNumber phone,
    List<PageRouteInfo>? children,
  }) : super(
          RegistrationContinueRoute.name,
          args: RegistrationContinueRouteArgs(
            key: key,
            login: login,
            password: password,
            phone: phone,
          ),
          initialChildren: children,
        );

  static const String name = 'RegistrationContinueRoute';

  static const PageInfo<RegistrationContinueRouteArgs> page =
      PageInfo<RegistrationContinueRouteArgs>(name);
}

class RegistrationContinueRouteArgs {
  const RegistrationContinueRouteArgs({
    this.key,
    required this.login,
    required this.password,
    required this.phone,
  });

  final Key? key;

  final String login;

  final String password;

  final PhoneNumber phone;

  @override
  String toString() {
    return 'RegistrationContinueRouteArgs{key: $key, login: $login, password: $password, phone: $phone}';
  }
}

/// generated route for
/// [RegistrationPage]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShopPage]
class ShopRoute extends PageRouteInfo<void> {
  const ShopRoute({List<PageRouteInfo>? children})
      : super(
          ShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShopRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TestsList]
class Testing extends PageRouteInfo<void> {
  const Testing({List<PageRouteInfo>? children})
      : super(
          Testing.name,
          initialChildren: children,
        );

  static const String name = 'Testing';

  static const PageInfo<void> page = PageInfo<void>(name);
}
