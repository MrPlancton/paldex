import 'package:paldex/data/source/local/models/ability.dart';
import 'package:paldex/data/source/local/models/aura.dart';
import 'package:paldex/data/source/local/models/item.dart';
import 'package:paldex/data/source/local/models/pal.dart';
import 'package:paldex/data/source/local/models/stats.dart';
import 'package:paldex/data/source/local/models/suitability.dart';
import 'package:paldex/domain/entities/item.dart';
import 'package:paldex/domain/entities/pal/pal.dart';
import 'package:paldex/domain/entities/pal/pal_ability.dart';
import 'package:paldex/domain/entities/pal/pal_aura.dart';
import 'package:paldex/domain/entities/pal/pal_stats.dart';
import 'package:paldex/domain/entities/pal/pal_suitability.dart';
import 'package:paldex/domain/entities/type/pal_types.dart';

extension PalHiveModelX on PalHiveModel {
  Pal toEntity({List<PalHiveModel> evolutions = const []}) => Pal(
      numId: numid,
      id: id.trim(),
      image: image.trim(),
      name: name.trim(),
      types: typeofpal.map((e) => PalTypes.parse(e.trim())).toList(),
      imageUrl: imageUrl.trim(),
      stats: stats.toEntity(),
      suitability: suitability.map((e) => e.toEntity()).toList(),
      drops: drops.map((e) => e.trim()).toList(),
      aura: aura.toEntity(),
      description: description.trim(),
      abilities: abilities.map((e) => e.toEntity()).toList());
}

extension PalStatsHiveModelX on StatsHiveModel {
  PalStats toEntity() => PalStats(
        maleProb: maleProb.trim(),
        femaleProb: femaleProb.trim(),
        size: size.trim(),
        price: price,
        rarity: rarity.trim(),
        hp: hp,
        meleeAttack: meleeAttack,
        shotAttack: shotAttack,
        defense: defense,
        support: support,
        passive1: passive1.trim(),
        passive2: passive2.trim(),
        craftSpeed: craftSpeed,
        slowWalkSpeed: slowWalkSpeed,
        walkSpeed: walkSpeed,
        runSpeed: runSpeed,
        rideSprintSpeed: rideSprintSpeed,
        transportSpeed: transportSpeed,
        stamina: stamina,
      );
}

extension PalSuitabilityHiveModelX on SuitabilityHiveModel {
  PalSuitability toEntity() => PalSuitability(type: type.trim(), level: level);
}

extension PalAuraHiveModelX on AuraHiveModel {
  PalAura toEntity() => PalAura(
        name: name.trim(),
        description: description.trim(),
      );
}

extension PalAbilityHiveModelX on AbilityHiveModel {
  PalAbility toEntity() => PalAbility(
        level: level,
        name: name.trim(),
        type: type.trim(),
        cooldown: cooldown,
        power: power,
        description: description.trim(),
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
