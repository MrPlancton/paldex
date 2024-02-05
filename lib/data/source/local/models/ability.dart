import 'package:hive/hive.dart';

part 'ability.g.dart';

@HiveType(typeId: 6)
class AbilityHiveModel extends HiveObject {
  static const String boxKey = 'ability';

  @HiveField(0)
  late int level;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String type;

  @HiveField(3)
  late int cooldown;

  @HiveField(4)
  late int power;

  @HiveField(5)
  late String description;
}
