import 'package:hive/hive.dart';

import 'pal_gender.dart';
import 'pal_stats.dart';

part 'pal.g.dart';

@HiveType(typeId: 1)
class PalHiveModel extends HiveObject {
  static const String boxKey = 'pal';

  @HiveField(0)
  late String number;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late List<String> types;

  @HiveField(4)
  late String image;

  @HiveField(5)
  late String height;

  @HiveField(6)
  late String weight;

  @HiveField(7)
  late String genera;

  @HiveField(8)
  late List<String> eggGroups;

  @HiveField(9)
  late PalGenderHiveModel gender;

  @HiveField(10)
  late PalStatsHiveModel stats;

  @HiveField(11)
  late double baseExp;

  @HiveField(12)
  late List<String> evolutions;

  @HiveField(13)
  late String evolutionReason;
}
