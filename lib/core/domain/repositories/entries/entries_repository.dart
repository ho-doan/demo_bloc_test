import 'package:bloc_ffff/core/data/remote_data_sources/entries_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/base_model.dart';
import '../../../data/models/entries.dart';

abstract class IEntriesRepository {
  @factoryMethod
  static EntriesRepository create(
    EntriesRemoteDataSource remoteDataSource,
  ) =>
      EntriesRepository(remoteDataSource);
  Future<Either<Exception, EntriesModel>> entries();
}

class EntriesRepository extends IEntriesRepository {
  final EntriesRemoteDataSource _remoteDataSource;

  EntriesRepository(this._remoteDataSource);
  @override
  Future<Either<BaseException, EntriesModel>> entries() async {
    try {
      return (await _remoteDataSource.entries()).fold(
        (l) => throw l,
        (r) => Right(r),
      );
    } on Exception catch (e) {
      return Left(BaseException.onException(e));
    }
  }
}
