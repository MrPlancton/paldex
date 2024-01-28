import 'package:flutter/material.dart';
import 'package:paldex/core/fade_page_route.dart';
import 'package:paldex/ui/screens/home/home.dart';
import 'package:paldex/ui/screens/items/items.dart';
import 'package:paldex/ui/screens/paldex/paldex.dart';
import 'package:paldex/ui/screens/pal_info/pal_info.dart';
import 'package:paldex/ui/screens/splash/splash.dart';
import 'package:paldex/ui/screens/types/type_screen.dart';

enum Routes { splash, home, paldex, palInfo, typeEffects, items }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String paldex = '/home/paldex';
  static const String palInfo = '/home/pal';
  static const String typeEffectsScreen = '/home/type';
  static const String itemsList = '/home/items';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.paldex: _Paths.paldex,
    Routes.palInfo: _Paths.palInfo,
    Routes.typeEffects: _Paths.typeEffectsScreen,
    Routes.items: _Paths.itemsList
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: const SplashScreen());

      case _Paths.paldex:
        return FadeRoute(page: const PaldexScreen());

      case _Paths.palInfo:
        return FadeRoute(page: const PalInfo());

      case _Paths.typeEffectsScreen:
        return FadeRoute(page: const TypeEffectScreen());

      case _Paths.itemsList:
        return FadeRoute(page: const ItemsScreen());

      case _Paths.home:
      default:
        return FadeRoute(page: const HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
