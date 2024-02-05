import 'package:flutter/material.dart';
import 'package:paldex/configs/colors.dart';
import 'package:paldex/domain/entities/type/pal_types.dart';

Color colorGenerator(PalTypes val) {
  switch (val) {
    case PalTypes.grass:
      return AppColors.lightTeal;

    case PalTypes.fire:
      return AppColors.lightRed;

    case PalTypes.water:
      return AppColors.lightBlue;

    case PalTypes.electric:
      return AppColors.lightYellow;

    case PalTypes.ground:
      return AppColors.lightBrown;

    case PalTypes.dark:
      return AppColors.black;

    default:
      return AppColors.lightBlue;
  }
}
