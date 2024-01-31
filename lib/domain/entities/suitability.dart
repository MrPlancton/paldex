import 'package:flutter/material.dart';

import 'pal_props.dart';
import 'pal_types.dart';

enum SuitabilityEnum {
  kindling,
  watering,
  planting,
  electricity,
  handiwork,
  gathering,
  lumbering,
  mining,
  medicine,
  cooling,
  transporting,
  farming;

  static SuitabilityEnum? fromString(String value) {
    for (final type in SuitabilityEnum.values) {
      if (type.toString() == value) {
        return type;
      }
    }
    return null;
  }
}

class Suitability {
  const Suitability({
    required this.level,
    required this.type,
  });

  final int level;
  final SuitabilityEnum type;
}
