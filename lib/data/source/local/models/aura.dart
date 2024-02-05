import 'package:hive/hive.dart';

part 'aura.g.dart';

@HiveType(typeId: 5)
class AuraHiveModel extends HiveObject {
  static const String boxKey = 'aura';

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String description;
}
