import 'package:hive/hive.dart';

part 'stats.g.dart';

@HiveType(typeId: 3)
class StatsHiveModel extends HiveObject {
  static const String boxKey = 'stats';

  @HiveField(0)
  late String maleProb;

  @HiveField(1)
  late String femaleProb;

  @HiveField(2)
  late String size;

  @HiveField(3)
  late double price;

  @HiveField(4)
  late String rarity;

  @HiveField(5)
  late int hp;

  @HiveField(6)
  late int meleeAttack;

  @HiveField(7)
  late int shotAttack;

  @HiveField(8)
  late int defense;

  @HiveField(9)
  late int support;

  @HiveField(10)
  late String passive1;

  @HiveField(11)
  late String passive2;

  @HiveField(12)
  late int craftSpeed;

  @HiveField(13)
  late int slowWalkSpeed;

  @HiveField(14)
  late int walkSpeed;

  @HiveField(15)
  late int runSpeed;

  @HiveField(16)
  late int rideSprintSpeed;

  @HiveField(17)
  late int transportSpeed;

  @HiveField(18)
  late int stamina;
}
