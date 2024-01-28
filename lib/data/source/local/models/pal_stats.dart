import 'package:hive/hive.dart';

part 'pal_stats.g.dart';

@HiveType(typeId: 3)
class PalStatsHiveModel extends HiveObject {
  static const String boxKey = 'palStats';

  @HiveField(0)
  late int attack;

  @HiveField(1)
  late int specialAttack;

  @HiveField(2)
  late int defense;

  @HiveField(3)
  late int specialDefense;

  @HiveField(4)
  late int hp;

  @HiveField(5)
  late int speed;
}
