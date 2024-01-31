import 'package:paldex/data/source/remote/remote_datasource.dart';
import 'package:paldex/domain/entities/pal.dart';

abstract class PalRepository {
  Future<List<Pal>> getAllPals();

  Future<List<Pal>> getPals({required int limit, required int page});

  Future<Pal?> getPal(String number);
}

class PalDefaultRepository extends PalRepository {
  PalDefaultRepository({required this.githubDataSource, required this.localDataSource});

  final RemoteDataSource githubDataSource;
  final LocalDataSource localDataSource;

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
      final palHiveModels = palGithubModels.map((e) => e.toHiveModel());

      await localDataSource.savePals(palHiveModels);
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
    final evolutions = await localDataSource.getEvolutions(palModel);

    final pal = palModel.toEntity(evolutions: evolutions);

    return pal;
  }
}
