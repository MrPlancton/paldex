import 'dart:ui';

import 'package:paldex/configs/colors.dart';

import '../../core/extensions/string.dart';
import '../../core/utils.dart';

enum PalTypes {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
  ground,
  fairy,
  fighting,
  psychic,
  rock,
  steel,
  ice,
  ghost,
  dragon,
  dark,
  monster,
  unknown;

  static PalTypes fromString(String rawValue) {
    final type = PalTypes.values.firstWhere(
      (element) => element.value.trim().toLowerCase() == rawValue.toLowerCase(),
      orElse: () => PalTypes.unknown,
    );

    return type;
  }
}

extension PalTypesX on PalTypes {
  String get value => getEnumValue(this).capitalize();

  static PalTypes parse(String rawValue) {
    final type = PalTypes.values.firstWhere(
      (element) => element.value.trim().toLowerCase() == rawValue.toLowerCase(),
      orElse: () => PalTypes.unknown,
    );

    return type;
  }

  Map<PalTypes, double> get effectiveness => _palEffectivenessMap[this] ?? {};

  Color get color {
    switch (this) {
      case PalTypes.grass:
        return AppColors.lightGreen;

      case PalTypes.bug:
        return AppColors.lightTeal;

      case PalTypes.fire:
        return AppColors.lightRed;

      case PalTypes.water:
        return AppColors.lightBlue;

      case PalTypes.fighting:
        return AppColors.red;

      case PalTypes.normal:
        return AppColors.beige;

      case PalTypes.electric:
        return AppColors.lightYellow;

      case PalTypes.psychic:
        return AppColors.lightPink;

      case PalTypes.poison:
        return AppColors.lightPurple;

      case PalTypes.ghost:
        return AppColors.purple;

      case PalTypes.ground:
        return AppColors.darkBrown;

      case PalTypes.rock:
        return AppColors.lightBrown;

      case PalTypes.dark:
        return AppColors.black;

      case PalTypes.dragon:
        return AppColors.violet;

      case PalTypes.fairy:
        return AppColors.pink;

      case PalTypes.flying:
        return AppColors.lilac;

      case PalTypes.ice:
        return AppColors.lightCyan;

      case PalTypes.steel:
        return AppColors.grey;

      default:
        return AppColors.lightBlue;
    }
  }
}

final _palEffectivenessMap = <PalTypes, Map<PalTypes, double>>{
  PalTypes.normal: {
    PalTypes.ghost: 0,
    PalTypes.fighting: 2,
  },
  PalTypes.fire: {
    PalTypes.bug: 0.5,
    PalTypes.fairy: 0.5,
    PalTypes.fire: 0.5,
    PalTypes.grass: 0.5,
    PalTypes.ice: 0.5,
    PalTypes.steel: 0.5,
    PalTypes.ground: 2,
    PalTypes.rock: 2,
    PalTypes.water: 2,
  },
  PalTypes.water: {
    PalTypes.fire: 0.5,
    PalTypes.ice: 0.5,
    PalTypes.steel: 0.5,
    PalTypes.water: 0.5,
    PalTypes.electric: 2,
    PalTypes.grass: 2,
  },
  PalTypes.electric: {
    PalTypes.electric: 0.5,
    PalTypes.flying: 0.5,
    PalTypes.steel: 0.5,
    PalTypes.ground: 2,
  },
  PalTypes.grass: {
    PalTypes.electric: 0.5,
    PalTypes.grass: 0.5,
    PalTypes.ground: 0.5,
    PalTypes.water: 0.5,
    PalTypes.bug: 2,
    PalTypes.ice: 2,
    PalTypes.flying: 2,
    PalTypes.fire: 2,
    PalTypes.poison: 2,
  },
  PalTypes.ice: {
    PalTypes.ice: 0.5,
    PalTypes.fire: 2,
    PalTypes.fighting: 2,
    PalTypes.rock: 2,
    PalTypes.steel: 2,
  },
  PalTypes.fighting: {
    PalTypes.bug: 0.5,
    PalTypes.rock: 0.5,
    PalTypes.dark: 0.5,
    PalTypes.flying: 2,
    PalTypes.psychic: 2,
    PalTypes.fairy: 2,
  },
  PalTypes.poison: {
    PalTypes.fighting: 0.5,
    PalTypes.poison: 0.5,
    PalTypes.bug: 0.5,
    PalTypes.fairy: 0.5,
    PalTypes.ground: 2,
    PalTypes.psychic: 2,
  },
  PalTypes.ground: {
    PalTypes.electric: 0,
    PalTypes.poison: 0.5,
    PalTypes.rock: 0.5,
    PalTypes.water: 2,
    PalTypes.grass: 2,
    PalTypes.ice: 2,
  },
  PalTypes.flying: {
    PalTypes.ground: 0,
    PalTypes.grass: 0.5,
    PalTypes.fighting: 0.5,
    PalTypes.bug: 0.5,
    PalTypes.electric: 2,
    PalTypes.ice: 2,
    PalTypes.rock: 2,
  },
  PalTypes.psychic: {
    PalTypes.fighting: 0.5,
    PalTypes.psychic: 0.5,
    PalTypes.bug: 2,
    PalTypes.ghost: 2,
    PalTypes.dark: 2,
  },
  PalTypes.bug: {
    PalTypes.grass: 0.5,
    PalTypes.fighting: 0.5,
    PalTypes.ground: 0.5,
    PalTypes.fire: 2,
    PalTypes.flying: 2,
    PalTypes.rock: 2,
  },
  PalTypes.rock: {
    PalTypes.normal: 0.5,
    PalTypes.fire: 0.5,
    PalTypes.poison: 0.5,
    PalTypes.flying: 0.5,
    PalTypes.water: 2,
    PalTypes.grass: 2,
    PalTypes.fighting: 2,
    PalTypes.ground: 2,
    PalTypes.steel: 2,
  },
  PalTypes.ghost: {
    PalTypes.normal: 0,
    PalTypes.fighting: 0,
    PalTypes.poison: 0.5,
    PalTypes.bug: 0.5,
    PalTypes.ghost: 2,
    PalTypes.dark: 2,
  },
  PalTypes.dragon: {
    PalTypes.fire: 0.5,
    PalTypes.water: 0.5,
    PalTypes.electric: 0.5,
    PalTypes.grass: 0.5,
    PalTypes.ice: 2,
    PalTypes.dragon: 2,
    PalTypes.fairy: 2,
  },
  PalTypes.dark: {
    PalTypes.psychic: 0,
    PalTypes.ghost: 0.5,
    PalTypes.dark: 0.5,
    PalTypes.fighting: 2,
    PalTypes.bug: 2,
    PalTypes.fairy: 2,
  },
  PalTypes.steel: {
    PalTypes.poison: 0,
    PalTypes.normal: 0.5,
    PalTypes.grass: 0.5,
    PalTypes.ice: 0.5,
    PalTypes.flying: 0.5,
    PalTypes.psychic: 0.5,
    PalTypes.bug: 0.5,
    PalTypes.rock: 0.5,
    PalTypes.dragon: 0.5,
    PalTypes.steel: 0.5,
    PalTypes.fairy: 0.5,
    PalTypes.fire: 2,
    PalTypes.fighting: 2,
    PalTypes.ground: 2,
  },
  PalTypes.fairy: {
    PalTypes.dragon: 0,
    PalTypes.fighting: 0.5,
    PalTypes.bug: 0.5,
    PalTypes.dark: 0.5,
    PalTypes.poison: 2,
    PalTypes.steel: 2,
  },
};
