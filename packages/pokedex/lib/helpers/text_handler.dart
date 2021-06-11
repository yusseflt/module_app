import 'package:flutter/material.dart';

abstract class TextHandler {
  static String capitalizeFirstLetter(String word) {
    return '${word[0].toUpperCase()}${word.substring(1, word.length)}';
  }

  static Color getTypeColor(String type) {
    Map typesColors = {
      "normal": Color.fromRGBO(168, 168, 125, 1),
      "fire": Color.fromRGBO(225, 134, 68, 1),
      "fighting": Color.fromRGBO(177, 61, 49, 1),
      "water": Color.fromRGBO(112, 143, 233, 1),
      "flying": Color.fromRGBO(225, 134, 68, 1),
      "grass": Color.fromRGBO(139, 198, 96, 1),
      "poison": Color.fromRGBO(148, 70, 155, 1),
      "eletric": Color.fromRGBO(242, 209, 84, 1),
      "ground": Color.fromRGBO(219, 193, 117, 1),
      "psychic": Color.fromRGBO(230, 99, 136, 1),
      "rock": Color.fromRGBO(180, 161, 75, 1),
      "ice": Color.fromRGBO(166, 214, 215, 1),
      "bug": Color.fromRGBO(171, 184, 66, 1),
      "dragon": Color.fromRGBO(105, 59, 239, 1),
      "ghost": Color.fromRGBO(108, 89, 148, 1),
      "dark": Color.fromRGBO(108, 89, 74, 1),
      "steel": Color.fromRGBO(184, 184, 206, 1),
      "fairy": Color.fromRGBO(226, 157, 172, 1),
      "???": Color.fromRGBO(117, 159, 145, 1),
    };

    return typesColors[type];
  }
}
