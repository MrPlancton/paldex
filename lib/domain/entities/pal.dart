import 'package:flutter/material.dart';

import 'pal_props.dart';
import 'pal_types.dart';

class Pal {
  const Pal({
    required this.number,
    required this.name,
    required this.description,
    required this.types,
    required this.image,
    required this.height,
    required this.weight,
    required this.genera,
    required this.eggGroups,
    required this.gender,
    required this.stats,
    required this.baseExp,
    required this.evolutions,
    required this.evolutionReason,
  });

  final String number;
  final String name;
  final String description;
  final List<PalTypes> types;
  final String image;
  final String height;
  final String weight;
  final String genera;
  final List<String> eggGroups;
  final PalGender gender;
  final PalStats stats;
  final double baseExp;
  final List<Pal> evolutions;
  final String evolutionReason;
}

extension PalX on Pal {
  Color get color => types.first.color;

  Map<PalTypes, double> get typeEffectiveness {
    final effectiveness =
        PalTypes.values.where((element) => element != PalTypes.unknown).map(
              (type) => MapEntry(
                type,
                types
                    .map((palType) => palType.effectiveness[type] ?? 1.0)
                    .reduce((total, effectiveness) => total * effectiveness),
              ),
            );

    return Map.fromEntries(effectiveness);
  }
}
