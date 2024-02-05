import 'package:hive/hive.dart';

part 'max_stats.g.dart';

@HiveType(typeId: 7)
class MaxStatsHiveModel extends HiveObject {
  static const String boxKey = 'max_stats';

  @HiveField(0)
  late int maxHp;

  @HiveField(1)
  late int maxMeleeAttack;

  @HiveField(2)
  late int maxShotAttack;

  @HiveField(3)
  late int maxDefense;

  @HiveField(4)
  late int maxSupport;

  @HiveField(5)
  late int maxCraftSpeed;

  @HiveField(6)
  late int maxSlowWalkSpeed;

  @HiveField(7)
  late int maxWalkSpeed;

  @HiveField(8)
  late int maxRunSpeed;

  @HiveField(9)
  late int maxRideSprintSpeed;

  @HiveField(10)
  late int maxTransportSpeed;

  @HiveField(11)
  late int maxStamina;
}
