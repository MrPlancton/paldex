// import 'package:paldex/data/source/local/models/item.dart';
// import 'package:paldex/data/source/local/models/pal.dart';
// import 'package:paldex/data/source/local/models/pal_gender.dart';
// import 'package:paldex/data/source/local/models/pal_stats.dart';
// import 'package:paldex/domain/entities/item.dart';
// import 'package:paldex/domain/entities/pal.dart';
// import 'package:paldex/domain/entities/pal_props.dart';
// import 'package:paldex/domain/entities/pal_types.dart';
//
// extension PalHiveModelX on PalHiveModel {
//
//   Pal toEntity({List<PalHiveModel> evolutions = const []}) => Pal(
//         id: id,
//         key: key.trim() ?? '',
//         image: image.trim() ?? '',
//         name: name.trim() ?? '',
//         wiki: wiki.trim() ?? '',
//         types: types.map((e) => PalTypes.fromString(e.trim())).toList() ?? [],
//         icon: icon.trim() ?? '',
//         suitability: suitability.map((e) => e.toEntity()).toList() ?? [],
//         drops: drops.map((e) => e.toEntity()).toList() ?? [],
//         aura: aura?.toEntity() ?? Aura(),
//         description: description.trim() ?? '',
//         skills: skills.map((e) => e.toEntity()).toList() ?? [],
//       );
// }
//
// extension PalGenderHiveModelX on PalGenderHiveModel {
//   PalGender toEntity() => PalGender(
//         male: male,
//         female: female,
//         genderless: genderless,
//       );
// }
//
// extension PalStatsHiveModelX on PalStatsHiveModel {
//   PalStats toEntity() => PalStats(
//         attack: attack,
//         specialAttack: specialAttack,
//         defense: defense,
//         specialDefense: specialDefense,
//         hp: hp,
//         speed: speed,
//       );
// }
//
// extension ItemHiveModelX on ItemHiveModel {
//   Item toEntity({List<ItemHiveModel> evolutions = const []}) => Item(
//         name: name?.trim() ?? '',
//         category: name?.trim() ?? '',
//         image: imageurl?.trim() ?? '',
//         effect: effect?.trim() ?? '',
//       );
// }
