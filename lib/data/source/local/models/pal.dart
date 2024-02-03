import 'package:hive/hive.dart';
import 'package:paldex/data/source/local/models/ability.dart';
import 'package:paldex/data/source/local/models/aura.dart';
import 'package:paldex/data/source/local/models/stats.dart';
import 'package:paldex/data/source/local/models/suitability.dart';

part 'pal.g.dart';

@HiveType(typeId: 1)
class PalHiveModel extends HiveObject {
  static const String boxKey = 'pal';

  @HiveField(0)
  late String id;

  @HiveField(1)
  late num numid;

  @HiveField(2)
  late String image;

  @HiveField(3)
  late String name;

  @HiveField(4)
  late List<String> typeofpal;

  @HiveField(5)
  late String imageUrl;

  @HiveField(6)
  late StatsHiveModel stats;

  @HiveField(7)
  late List<SuitabilityHiveModel> suitability;

  @HiveField(8)
  late List<String> drops;

  @HiveField(9)
  late AuraHiveModel aura;

  @HiveField(10)
  late String description;

  @HiveField(11)
  late List<AbilityHiveModel> abilities;
}
