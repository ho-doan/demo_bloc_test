import 'package:bloc_ffff/core/data/models/entries.dart';
import 'package:bloc_ffff/core/services/data_source/networks/i_api_client.dart';
import 'package:dartz/dartz.dart';

class EntriesRemoteDataSource {
  final IApiClient _apiClient;

  EntriesRemoteDataSource(this._apiClient);

  Future<Either<Exception, EntriesModel>> entries() async {
    try {
      return Right(await _apiClient.entries());
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
