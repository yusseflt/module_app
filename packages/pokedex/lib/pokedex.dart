library pokedex;

import 'package:flutter/material.dart';
import 'package:pokedex/repository/navigator_manager.dart';

class Pokedex extends StatelessWidget {
  final GlobalKey<NavigatorState> parentNavigatorKey;
  const Pokedex({Key? key, required this.parentNavigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorManager navigatorManager = NavigatorManager.instance;
    navigatorManager.parentNavigatorKey = parentNavigatorKey;

    return Navigator(
      key: navigatorManager.navigatorKey,
      initialRoute: 'pokedex',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: navigatorManager.routes[settings.name]!,
        );
      },
    );
  }
}
