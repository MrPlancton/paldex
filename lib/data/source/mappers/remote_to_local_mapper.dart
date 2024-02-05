import 'package:paldex/data/source/local/models/ability.dart';
import 'package:paldex/data/source/local/models/aura.dart';
import 'package:paldex/data/source/local/models/item.dart';
import 'package:paldex/data/source/local/models/pal.dart';
import 'package:paldex/data/source/local/models/stats.dart';
import 'package:paldex/data/source/local/models/suitability.dart';
import 'package:paldex/data/source/remote/models/ability.dart';
import 'package:paldex/data/source/remote/models/aura.dart';
import 'package:paldex/data/source/remote/models/item.dart';
import 'package:paldex/data/source/remote/models/pal.dart';
import 'package:paldex/data/source/remote/models/stats.dart';
import 'package:paldex/data/source/remote/models/suitability.dart';

extension RemotePalModelToLocalX on RemotePalModel {
  PalHiveModel toHiveModel() => PalHiveModel()
    ..numid = numid
    ..id = id.trim()
    ..image = image.trim()
    ..name = name.trim()
    ..typeofpal = typeofpal.map((e) => e.trim()).toList()
    ..imageUrl = imageUrl.trim()
    ..stats = stats.toHiveModel()
    ..suitability = suitability.map((e) => e.toHiveModel()).toList()
    ..drops = drops.map((e) => e.trim()).toList()
    ..aura = aura.toHiveModel()
    ..description = description.trim()
    ..abilities = abilities.map((e) => e.toHiveModel()).toList();
}

extension RemoteItemModelToLocalX on RemoteItemModel {
  ItemHiveModel toHiveModel() => ItemHiveModel()
    ..name = name.trim()
    ..category = category.trim()
    ..imageurl = imageurl.trim()
    ..effect = effect.trim();
}

extension RemoteStatsModelToLocalX on RemoteStatsModel {
  StatsHiveModel toHiveModel() => StatsHiveModel()
    ..maleProb = maleProb
    ..femaleProb = femaleProb
    ..size = size
    ..price = double.tryParse(price) ?? 0.0
    ..rarity = rarity
    ..hp = int.tryParse(hp) ?? 0
    ..meleeAttack = int.tryParse(meleeAttack) ?? 0
    ..shotAttack = int.tryParse(shotAttack) ?? 0
    ..defense = int.tryParse(defense) ?? 0
    ..support = int.tryParse(support) ?? 0
    ..passive1 = passive1
    ..passive2 = passive2
    ..craftSpeed = int.tryParse(craftSpeed) ?? 0
    ..slowWalkSpeed = int.tryParse(slowWalkSpeed) ?? 0
    ..walkSpeed = int.tryParse(walkSpeed) ?? 0
    ..runSpeed = int.tryParse(runSpeed) ?? 0
    ..rideSprintSpeed = int.tryParse(rideSprintSpeed) ?? 0
    ..transportSpeed = int.tryParse(transportSpeed) ?? 0
    ..stamina = int.tryParse(stamina) ?? 0;
}

extension RemoteSuitabilityModelToLocalX on RemoteSuitabilityModel {
  SuitabilityHiveModel toHiveModel() => SuitabilityHiveModel()
    ..type = type
    ..level = level;
}

extension RemoteAuraModelToLocalX on RemoteAuraModel {
  AuraHiveModel toHiveModel() => AuraHiveModel()
    ..name = name
    ..description = description;
}

extension AbilityModelToLocalX on RemoteAbilityModel {
  AbilityHiveModel toHiveModel() => AbilityHiveModel()
    ..level = level
    ..name = name
    ..type = type
    ..cooldown = cooldown
    ..power = power
    ..description = description;
}
