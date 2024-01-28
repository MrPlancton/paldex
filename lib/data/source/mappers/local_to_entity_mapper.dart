import 'package:paldex/data/source/local/models/item.dart';
import 'package:paldex/data/source/local/models/pal.dart';
import 'package:paldex/data/source/local/models/pal_gender.dart';
import 'package:paldex/data/source/local/models/pal_stats.dart';
import 'package:paldex/domain/entities/item.dart';
import 'package:paldex/domain/entities/pal.dart';
import 'package:paldex/domain/entities/pal_props.dart';
import 'package:paldex/domain/entities/pal_types.dart';

extension PalHiveModelX on PalHiveModel {
  Pal toEntity({List<PalHiveModel> evolutions = const []}) => Pal(
        number: number.trim(),
        name: name.trim(),
        description: description.trim(),
        types: types.map((e) => PalTypesX.parse(e)).toList(),
        image: image.trim(),
        height: height.trim(),
        weight: weight.trim(),
        genera: genera.trim(),
        eggGroups: eggGroups.map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
        gender: gender.toEntity(),
        stats: stats.toEntity(),
        baseExp: baseExp,
        evolutions: evolutions.map((e) => e.toEntity()).toList(),
        evolutionReason: evolutionReason,
      );
}

extension PalGenderHiveModelX on PalGenderHiveModel {
  PalGender toEntity() => PalGender(
        male: male,
        female: female,
        genderless: genderless,
      );
}

extension PalStatsHiveModelX on PalStatsHiveModel {
  PalStats toEntity() => PalStats(
        attack: attack,
        specialAttack: specialAttack,
        defense: defense,
        specialDefense: specialDefense,
        hp: hp,
        speed: speed,
      );
}

extension ItemHiveModelX on ItemHiveModel {
  Item toEntity({List<ItemHiveModel> evolutions = const []}) => Item(
        name: name?.trim() ?? '',
        category: name?.trim() ?? '',
        image: imageurl?.trim() ?? '',
        effect: effect?.trim() ?? '',
      );
}
