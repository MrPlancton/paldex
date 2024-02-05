import 'dart:math';

import 'package:paldex/data/source/local/local_datasource.dart';
import 'package:paldex/data/source/local/models/pal.dart';
import 'package:paldex/data/source/local/utils/max_stats.dart';
import 'package:paldex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:paldex/domain/entities/utils/max_stats.dart';

abstract class UtilsRepository {
  Future<MaxStats?> getMaxStats();

  Future<void> saveMaxStats(List<PalHiveModel> pals);
}

class UtilsDefaultRepository extends UtilsRepository {
  UtilsDefaultRepository({required this.localDataSource});

  final LocalDataSource localDataSource;

  @override
  Future<MaxStats?> getMaxStats() async {
    final maxStatsModel = await localDataSource.getMaxStats();
    if (maxStatsModel == null) return null;

    return maxStatsModel.toEntity();
  }

  MaxStatsHiveModel _getMaxStatsFromPalsList(List<PalHiveModel> pals) {
    final maxStats = MaxStatsHiveModel()
      ..maxHp = pals.map((e) => e.stats.hp).reduce(max)
      ..maxMeleeAttack = pals.map((e) => e.stats.meleeAttack).reduce(max)
      ..maxShotAttack = pals.map((e) => e.stats.shotAttack).reduce(max)
      ..maxDefense = pals.map((e) => e.stats.defense).reduce(max)
      ..maxSupport = pals.map((e) => e.stats.support).reduce(max)
      ..maxCraftSpeed = pals.map((e) => e.stats.craftSpeed).reduce(max)
      ..maxSlowWalkSpeed = pals.map((e) => e.stats.slowWalkSpeed).reduce(max)
      ..maxWalkSpeed = pals.map((e) => e.stats.walkSpeed).reduce(max)
      ..maxRunSpeed = pals.map((e) => e.stats.runSpeed).reduce(max)
      ..maxRideSprintSpeed = pals.map((e) => e.stats.rideSprintSpeed).reduce(max)
      ..maxTransportSpeed = pals.map((e) => e.stats.transportSpeed).reduce(max)
      ..maxStamina = pals.map((e) => e.stats.stamina).reduce(max);
    return maxStats;
  }

  @override
  Future<void> saveMaxStats(List<PalHiveModel> pals) async {
    var maxStats = _getMaxStatsFromPalsList(pals);
    await localDataSource.saveMaxStats(maxStats);
  }
}
