import 'package:flutter/material.dart';
import 'package:weather/pages/details_page.dart';
import 'package:weather/pages/weather_page.dart';

class NavigatorManager {
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState>? parentNavigatorKey;

  NavigatorManager._();

  Map<String, Widget Function(BuildContext)> get routes => {
        "weather": (context) => WeatherPage(),
        "weatherDetails": (context) =>
            WeatherDetailsPage(ModalRoute.of(context)!.settings.arguments),
      };

  static NavigatorState get navigator =>
      NavigatorManager.instance.navigatorKey.currentState!;

  static NavigatorState get parentNavigator =>
      NavigatorManager.instance.parentNavigatorKey!.currentState!;
}
