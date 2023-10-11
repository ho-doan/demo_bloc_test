import 'package:bloc_ffff/core/data/models/base_model.dart';
import 'package:bloc_ffff/core/domain/repositories/entries/entries_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/entries.dart';

class EntriesUseCase {
  final EntriesRepository _repository;

  EntriesUseCase(this._repository);

  Future<Either<BaseException, EntriesModel>> entries() =>
      _repository.entries();
}
