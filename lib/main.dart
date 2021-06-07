import 'package:flutter/material.dart';
import 'package:module_app/repository/remote_config_manager.dart';
import 'package:module_app/repository/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RemoteConfigManager.initFirebase();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: RouteManager().routes,
    );
  }
}
