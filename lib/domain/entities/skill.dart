import 'package:flutter/material.dart';

import 'pal_props.dart';
import 'pal_types.dart';

class Skill {
  const Skill({
    required this.level,
    required this.name,
    required this.type,
    required this.cooldown,
    required this.power,
    required this.description,
  });

  final int level;
  final String name;
  final PalTypes type;
  final int cooldown;
  final int power;
  final String description;

}