import 'package:flutter/material.dart';
import 'package:pokedex/pages/pokemon_details_page.dart';
import 'package:pokedex/pages/pokedex_page.dart';

class NavigatorManager {
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState>? parentNavigatorKey;

  NavigatorManager._();

  Map<String, Widget Function(BuildContext)> get routes => {
        "pokedex": (context) => PokedexPage(),
        "pokemonDetails": (context) =>
            PokemonDetailsPage(ModalRoute.of(context)!.settings.arguments)
      };

  static NavigatorState get navigator =>
      NavigatorManager.instance.navigatorKey.currentState!;

  static NavigatorState get parentNavigator =>
      NavigatorManager.instance.parentNavigatorKey!.currentState!;
}
