import 'package:flutter/material.dart';
import 'package:paldex/domain/entities/aura.dart';
import 'package:paldex/domain/entities/drop/base_drop.dart';
import 'package:paldex/domain/entities/skill.dart';
import 'package:paldex/domain/entities/suitability.dart';

import 'pal_props.dart';
import 'pal_types.dart';

class Pal {
  const Pal(
      {required this.id,
      required this.key,
      required this.image,
      required this.name,
      required this.wiki,
      required this.types,
      required this.icon,
      required this.suitability,
      required this.drops,
      required this.aura,
      required this.description,
      required this.skills});

  final int id;
  final String key;
  final String image;
  final String name;
  final String wiki;
  final List<PalTypes> types;
  final String icon;
  final List<Suitability> suitability;
  final BaseDrop drops;
  final Aura aura;
  final String description;
  final List<Skill> skills;
}

extension PalX on Pal {
  Color get color => types.first.color;

  Map<PalTypes, double> get typeEffectiveness {
    final effectiveness = PalTypes.values.where((element) => element != PalTypes.unknown).map(
          (type) => MapEntry(
            type,
            types.map((palType) => palType.effectiveness[type] ?? 1.0).reduce((total, effectiveness) => total * effectiveness),
          ),
        );

    return Map.fromEntries(effectiveness);
  }
}
