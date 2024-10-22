import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex_24_sept/utils/helpers/constants.dart';

class Helpers {
  static Color? getPokemonCardColour({required String pokemonType}) {
    switch (pokemonType) {
      case 'Normal':
        return Constants.lightBlue;
      case 'Fire':
        return Constants.darkRed;
      case 'Water':
        return Constants.lightBlue;
      case 'Electric':
        return Colors.amber;
      case 'Grass':
        return Constants.lightGreen;
      case 'Ice':
        return Constants.lightBlue;
      case 'Fighting':
        return Colors.orange[900];
      case 'Poison':
        return Colors.deepPurpleAccent;
      case 'Ground':
        return Colors.brown;
      case 'Glying':
        return Constants.darkBlue;
      case 'Psychic':
        return Constants.darkYellow;
      case 'Bug':
        return Colors.green[200];
      case 'Rock':
        return Colors.grey[500];
      case 'Ghost':
        return Colors.deepPurple;
      default:
        return Constants.lightBlue;
    }
  }
}
