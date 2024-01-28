import 'package:hive/hive.dart';

part 'pal_gender.g.dart';

@HiveType(typeId: 2)
class PalGenderHiveModel extends HiveObject {
  static const String boxKey = 'palGender';

  @HiveField(0)
  late bool genderless;

  @HiveField(1)
  late double male;

  @HiveField(2)
  late double female;
}
