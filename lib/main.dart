import 'package:flutter/material.dart';
import 'package:module_app/repository/remote_config_manager.dart';
import 'package:module_app/repository/route_manager.dart';
import 'package:pokedex/pokedex.dart';
import 'package:weather/weather.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    RemoteConfigManager.initFirebase();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'weather':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => Weather(
                parentNavigatorKey: navigatorKey,
              ),
            );
          case 'pokedex':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => Pokedex(
                parentNavigatorKey: navigatorKey,
              ),
            );
          default:
            return MaterialPageRoute(
              settings: settings,
              builder: RouteManager().routes[settings.name]!,
            );
        }
      },
    );
  }
}
