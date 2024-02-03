import 'package:flutter/material.dart';
import 'package:paldex/domain/entities/pal/pal_ability.dart';
import 'package:paldex/domain/entities/pal/pal_aura.dart';
import 'package:paldex/domain/entities/pal/pal_effectiveness.dart';
import 'package:paldex/domain/entities/pal/pal_stats.dart';
import 'package:paldex/domain/entities/pal/pal_suitability.dart';
import 'package:paldex/domain/entities/type/pal_types.dart';

class Pal {
  const Pal({
    required this.numId,
    required this.id,
    required this.name,
    required this.description,
    required this.types,
    required this.image,
    required this.imageUrl,
    required this.stats,
    required this.suitability,
    required this.drops,
    required this.aura,
    required this.abilities,
  });

  final num numId;
  final String id;
  final String image;
  final String name;
  final List<PalTypes> types;
  final String imageUrl;
  final PalStats stats;
  final List<PalSuitability> suitability;
  final List<String> drops;
  final PalAura aura;
  final String description;
  final List<PalAbility> abilities;
}

extension PalX on Pal {
  Color get color => types.first.color;

  Map<PalTypes, PalEffectiveness> get effectiveness {
    return types.fold<Map<PalTypes, PalEffectiveness>>(
      {},
      (map, type) => map..addAll(type.effectiveness),
    );
  }
}
