import 'package:flutter/material.dart';
import 'package:paldex/configs/colors.dart';
import 'package:paldex/domain/entities/pal_types.dart';

Color colorGenerator(PalTypes val) {
  switch (val) {
    case PalTypes.grass:
    case PalTypes.bug:
      return AppColors.lightTeal;

    case PalTypes.fire:
      return AppColors.lightRed;

    case PalTypes.water:
      return AppColors.lightBlue;

    case PalTypes.normal:
    case PalTypes.flying:
      return AppColors.semiGrey;

    case PalTypes.fighting:
      return AppColors.brown;

    case PalTypes.electric:
    case PalTypes.psychic:
      return AppColors.lightYellow;

    case PalTypes.poison:
    case PalTypes.ghost:
      return AppColors.lightPurple;

    case PalTypes.ground:
    case PalTypes.rock:
      return AppColors.lightBrown;

    case PalTypes.dark:
      return AppColors.black;

    case PalTypes.fairy:
      return AppColors.lightPink;

    default:
      return AppColors.lightBlue;
  }
}
