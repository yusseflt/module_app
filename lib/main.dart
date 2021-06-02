import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:module_app/repository/data_manager.dart';
import 'package:module_app/repository/route_manager.dart';
import 'package:weather/weather.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Weather.initFirebase();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
      builder: (context, child) => DataManager(child: child!),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: RouteManager().routes,
    );
  }
}
