import 'package:hive/hive.dart';

part 'suitability.g.dart';

@HiveType(typeId: 2)
class SuitabilityHiveModel extends HiveObject {
  static const String boxKey = 'suitability';

  @HiveField(0)
  late String type;

  @HiveField(1)
  late int level;
}
