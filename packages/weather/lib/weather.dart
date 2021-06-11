library weather;

import 'package:flutter/material.dart';

import 'package:weather/repository/api_manager.dart';
import 'package:weather/repository/navigator_manager.dart';

class Weather extends StatelessWidget {
  final parentNavigatorKey;

  Weather({required this.parentNavigatorKey});

  static addApiKey(String apiKey) {
    ApiManager.instance.addKey(apiKey);
  }

  @override
  Widget build(BuildContext context) {
    NavigatorManager navigatorManager = NavigatorManager.instance;
    navigatorManager.parentNavigatorKey = parentNavigatorKey;
    return Navigator(
      key: navigatorManager.navigatorKey,
      initialRoute: 'weather',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: navigatorManager.routes[settings.name]!,
        );
      },
    );
  }
}
