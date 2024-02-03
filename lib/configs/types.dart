import 'package:flutter/material.dart';
import 'package:paldex/domain/entities/type/pal_types.dart';

class PokeTypes {
  const PokeTypes({
    required this.type,
    required this.superEffective,
    required this.notEffective,
    required this.nilEffective,
    required this.color,
  });

  final PalTypes type;
  final List<String> superEffective;
  final List<String> notEffective;
  final List<String> nilEffective;
  final Color color;
}

List<PokeTypes> tps = [];
const List<PokeTypes> types = [
  PokeTypes(
    type: PalTypes.fire,
    superEffective: ["Bug", "Steel", "Grass", "Ice"],
    notEffective: ["Rock", "Fire", "Water", "Dragon"],
    nilEffective: [],
    color: Color(0xFFf08030),
  ),
  PokeTypes(
    type: PalTypes.water,
    notEffective: ["Water", "Grass", "Dragon"],
    superEffective: ["Ground", "Rock", "Fire"],
    nilEffective: [],
    color: Color(0xFF6890f0),
  ),
  PokeTypes(
    type: PalTypes.electric,
    notEffective: ["Grass", "Electric", "Dragon"],
    superEffective: ["Flying", "Water"],
    nilEffective: ["Ground"],
    color: Color(0xFFf8b00f),
  ),
  PokeTypes(
    type: PalTypes.grass,
    nilEffective: [],
    superEffective: ["Ground", "Rock", "Water"],
    notEffective: ["Flying", "Poison", "Bug", "Steel", "Fire", "Grass", "Dragon"],
    color: Color(0xFF78c851),
  ),
  PokeTypes(
    type: PalTypes.ice,
    notEffective: ["Steel", "Fire", "Water", "Ice"],
    superEffective: ["Flying", "Ground", "Grass", "Dragon"],
    nilEffective: [],
    color: Color(0xFF98d9d8),
  ),
  PokeTypes(
    type: PalTypes.ground,
    nilEffective: ["Flying"],
    superEffective: ["Poison", "Rock", "Steel", "Fire", "Electric"],
    notEffective: ["Bug", "Grass"],
    color: Color(0xFFd8e02f),
  ),
  PokeTypes(
    type: PalTypes.dragon,
    superEffective: ["Dragon"],
    nilEffective: ["Fairy"],
    notEffective: ["Steel"],
    color: Color(0xFF623bd5),
  ),
  PokeTypes(
    type: PalTypes.dark,
    superEffective: ["Ghost", "Psychic"],
    nilEffective: [],
    notEffective: ["Fighting", "Dark", "Fairy"],
    color: Color(0xFF776554),
  ),
];
