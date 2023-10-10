import 'package:bloc_ffff/core/domain/repositories/entries/entries_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/entries.dart';

class EntriesUseCase {
  final EntriesRepository _repository;

  EntriesUseCase(this._repository);

  Future<Either<Exception, EntriesModel>> entries() => _repository.entries();
}
