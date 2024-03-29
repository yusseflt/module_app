import 'package:flutter/material.dart';
import 'package:module_app/pages/home_page.dart';
import 'package:module_app/pages/music_list_page.dart';

class RouteManager {
  static Map<String, Widget Function(BuildContext)> _routes = {};

  Map<String, Widget Function(BuildContext)> get routes => _routes;

  RouteManager() {
    _routes = {
      "home": (context) => HomePage(),
      "musicList": (context) => MusicListPage(),
    };
  }
}
