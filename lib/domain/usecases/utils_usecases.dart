import 'package:paldex/core/usecase.dart';
import 'package:paldex/data/repositories/utils_repository.dart';
import 'package:paldex/domain/entities/utils/max_stats.dart';

class GetMaxStatsCase extends NoParamsUseCase<MaxStats?> {
  final UtilsRepository repository;

  const GetMaxStatsCase(this.repository);

  @override
  Future<MaxStats?> call() {
    return repository.getMaxStats();
  }
}
