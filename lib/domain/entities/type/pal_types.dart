import 'dart:ui';

import 'package:paldex/configs/colors.dart';
import 'package:paldex/domain/entities/pal/pal_effectiveness.dart';

import '../../../core/extensions/string.dart';
import '../../../core/utils.dart';

enum PalTypes {
  neutral,
  grass,
  fire,
  water,
  electric,
  ground,
  ice,
  dragon,
  dark,
  unknown;

  static PalTypes parse(String rawValue) {
    final type = PalTypes.values.firstWhere(
          (element) => element.value.trim().toLowerCase() == rawValue.toLowerCase(),
      orElse: () => PalTypes.unknown,
    );

    return type;
  }
}

extension PalTypesX on PalTypes {
  String get value => getEnumValue(this).capitalize();



  Map<PalTypes, PalEffectiveness> get effectiveness => _palEffectivenessMap[this] ?? {};

  Color get color {
    switch (this) {
      case PalTypes.neutral:
        return AppColors.beige;

      case PalTypes.grass:
        return AppColors.lightGreen;

      case PalTypes.fire:
        return AppColors.lightRed;

      case PalTypes.water:
        return AppColors.lightBlue;

      case PalTypes.electric:
        return AppColors.lightYellow;

      case PalTypes.ground:
        return AppColors.darkBrown;

      case PalTypes.dark:
        return AppColors.black;

      case PalTypes.dragon:
        return AppColors.violet;

      case PalTypes.ice:
        return AppColors.lightCyan;

      default:
        return AppColors.lightBlue;
    }
  }
}

final _palEffectivenessMap = <PalTypes, Map<PalTypes, PalEffectiveness>>{
  PalTypes.neutral: {
    PalTypes.dark: PalEffectiveness.weak,
  },
  PalTypes.water: {
    PalTypes.electric: PalEffectiveness.weak,
    PalTypes.fire: PalEffectiveness.strong,
  },
  PalTypes.fire: {
    PalTypes.grass: PalEffectiveness.weak,
    PalTypes.water: PalEffectiveness.strong,
  },
  PalTypes.electric: {
    PalTypes.water: PalEffectiveness.strong,
    PalTypes.ground: PalEffectiveness.weak,
  },
  PalTypes.grass: {
    PalTypes.ground: PalEffectiveness.strong,
    PalTypes.fire: PalEffectiveness.weak,
  },
  PalTypes.ice: {
    PalTypes.dragon: PalEffectiveness.strong,
    PalTypes.fire: PalEffectiveness.weak,
  },
  PalTypes.ground: {
    PalTypes.electric: PalEffectiveness.strong,
    PalTypes.grass: PalEffectiveness.weak,
  },
  PalTypes.dragon: {
    PalTypes.dark: PalEffectiveness.strong,
    PalTypes.ice: PalEffectiveness.weak,
  },
  PalTypes.dark: {
    PalTypes.neutral: PalEffectiveness.strong,
    PalTypes.dragon: PalEffectiveness.weak,
  },
};
