// import 'package:paldex/core/extensions/string.dart';
// import 'package:paldex/data/source/local/models/item.dart';
// import 'package:paldex/data/source/local/models/pal.dart';
// import 'package:paldex/data/source/local/models/pal_gender.dart';
// import 'package:paldex/data/source/local/models/pal_stats.dart';
//
// extension GithubPalModelToLocalX on RemotePalModel {
//   PalHiveModel toHiveModel() => PalHiveModel()
//     ..number = id.trim()
//     ..name = name.trim()
//     ..description = xDescription.trim()
//     ..types = types.toList(growable: false)
//     ..image = imageUrl.trim()
//     ..height = height.trim()
//     ..weight = weight.trim()
//     ..genera = category.trim()
//     ..eggGroups = eggGroups?.split(RegExp(r',\s*?')).map((e) => e.trim()).toList() ?? []
//     ..gender = (PalGenderHiveModel()
//       ..male = genderMalePercentage?.parseDouble() ?? 0
//       ..female = genderFemalePercentage?.parseDouble() ?? 0
//       ..genderless = genderless == 1)
//     ..stats = (PalStatsHiveModel()
//       ..hp = hp.toInt()
//       ..speed = speed.toInt()
//       ..attack = attack.toInt()
//       ..defense = defense.toInt()
//       ..specialAttack = specialAttack.toInt()
//       ..specialDefense = specialDefense.toInt())
//     ..baseExp = baseExp.parseDouble()
//     ..evolutions = evolutions
//     ..evolutionReason = reason ?? '';
// }
//
// extension RemoteItemModelToLocalX on RemoteItemModel {
//   ItemHiveModel toHiveModel() => ItemHiveModel()
//     ..name = name.trim()
//     ..category = category.trim()
//     ..imageurl = imageurl.trim()
//     ..effect = effect.trim();
// }
