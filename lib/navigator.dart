// ignore_for_file: constant_identifier_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_test_project/features/home/presentation/pages/home.dart';
import 'package:flutter_test_project/features/splash/presentation/pages/splash.dart';
import 'package:flutter_test_project/features/create_user/presentation/pages/create_user.dart';

enum Routes {
  INIT,
  HOME,
  CREATEUSER,
}

class _Page {
  static const String init = "/";
  static const String home = "/home";
  static const String createUser = "/createUser";

  static const Map<Routes, String> _pageMap = {
    Routes.INIT: init,
    Routes.HOME: home,
    Routes.CREATEUSER: createUser,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;

    late Map<String, dynamic> argumentsCreateUser = {};
    if (arguments is Map<String, dynamic>) {
      argumentsCreateUser = arguments;
    }

    switch (settings.name) {
      case _Page.init:
        return _pageRoute(page: const Splash());
      case _Page.home:
        return _pageRoute(routeSettings: settings, page: const Home());
      case _Page.createUser:
        return _pageRoute(
          page: CreateUser(arguments: argumentsCreateUser),
          routeSettings: settings,
        );

      default:
        return _pageRoute(page: const Splash(), routeSettings: settings);
    }
  }

  static Route _pageRoute({
    required Widget page,
    RouteSettings? routeSettings,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            settings: routeSettings, builder: (context) => page)
        : MaterialPageRoute(
            settings: routeSettings,
            builder: (BuildContext context) => page,
          );
  }

  static void pop({Map<String, dynamic>? params}) => state.pop(params);

  static Future pushNamedAndRemoveUntil<T>(Routes route, {arguments}) =>
      state.pushNamedAndRemoveUntil(
        _Page.page(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static Future push<T>(Routes route, {Map<String, dynamic>? arguments}) =>
      state.pushNamed(
        _Page.page(route)!,
        arguments: arguments,
      );

  static void popUntil(Routes route) {
    state.popUntil(
      (Route<dynamic> routes) => routes.settings.name == _Page.page(route)!,
    );
  }
}
