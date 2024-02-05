import 'package:paldex/data/repositories/utils_repository.dart';
import 'package:paldex/data/source/local/local_datasource.dart';
import 'package:paldex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:paldex/data/source/mappers/remote_to_local_mapper.dart';
import 'package:paldex/data/source/remote/remote_datasource.dart';
import 'package:paldex/domain/entities/pal/pal.dart';
import 'package:paldex/domain/entities/utils/max_stats.dart';

abstract class PalRepository {
  Future<List<Pal>> getAllPals();

  Future<List<Pal>> getPals({required int limit, required int page});

  Future<Pal?> getPal(String number);

  Future<MaxStats?> getPlaMaxStats();

//Future<List<Pal>> getEvolutions(Pal pal);
}

class PalDefaultRepository extends PalRepository {
  PalDefaultRepository({required this.githubDataSource, required this.localDataSource, required this.utilsRepository});

  final RemoteDataSource githubDataSource;
  final LocalDataSource localDataSource;
  final UtilsRepository utilsRepository;

  @override
  Future<List<Pal>> getAllPals() async {
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final palGithubModels = await githubDataSource.getPals();
      final palHiveModels = palGithubModels.map((e) => e.toHiveModel());

      await localDataSource.savePals(palHiveModels);
    }

    final palHiveModels = await localDataSource.getAllPals();

    final palEntities = palHiveModels.map((e) => e.toEntity()).toList();

    return palEntities;
  }

  @override
  Future<List<Pal>> getPals({required int limit, required int page}) async {
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final palGithubModels = await githubDataSource.getPals();
      final palHiveModels = palGithubModels.map((e) => e.toHiveModel()).toList();

      await localDataSource.savePals(palHiveModels);
      await utilsRepository.saveMaxStats(palHiveModels);
    }

    final palHiveModels = await localDataSource.getPals(
      page: page,
      limit: limit,
    );
    final palEntities = palHiveModels.map((e) => e.toEntity()).toList();

    return palEntities;
  }

  @override
  Future<Pal?> getPal(String number) async {
    final palModel = await localDataSource.getPal(number);

    if (palModel == null) return null;

    // get all evolutions
    //final evolutions = await localDataSource.getEvolutions(palModel);

    final pal = palModel.toEntity(evolutions: []);

    return pal;
  }

  @override
  Future<MaxStats?> getPlaMaxStats() async {
    final palMaxStats = await localDataSource.getMaxStats();
    return palMaxStats?.toEntity();
  }
}
