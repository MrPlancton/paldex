import '../../core/usecase.dart';
import '../../data/repositories/pal_repository.dart';
import '../entities/pal/pal.dart';

class GetAllPalsUseCase extends NoParamsUseCase<List<Pal>> {
  const GetAllPalsUseCase(this.repository);

  final PalRepository repository;

  @override
  Future<List<Pal>> call() {
    return repository.getAllPals();
  }
}

class GetPalsParams {
  const GetPalsParams({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;
}

class GetPalsUseCase extends UseCase<List<Pal>, GetPalsParams> {
  const GetPalsUseCase(this.repository);

  final PalRepository repository;

  @override
  Future<List<Pal>> call(GetPalsParams params) {
    return repository.getPals(page: params.page, limit: params.limit);
  }
}

class GetPalParam {
  final String number;

  const GetPalParam(this.number);
}

class GetPalUseCase extends UseCase<Pal?, GetPalParam> {
  final PalRepository repository;

  const GetPalUseCase(this.repository);

  @override
  Future<Pal?> call(GetPalParam params) {
    return repository.getPal(params.number);
  }
}
