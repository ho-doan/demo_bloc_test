// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../feature/detail/cubit/detail_cubit.dart' as _i8;
import '../../../feature/home/cubit/home_cubit.dart' as _i7;
import '../../data/models/entry.dart' as _i9;
import '../../data/remote_data_sources/entries_remote_data_source.dart' as _i4;
import '../../domain/repositories/entries/entries_repository.dart' as _i5;
import '../../domain/use_cases/entries_use_case.dart' as _i6;
import '../data_source/networks/i_api_client.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ApiUtil>(() => _i3.ApiUtil());
  gh.factory<_i4.EntriesRemoteDataSource>(
      () => _i4.EntriesRemoteDataSource(gh<_i3.ApiClient>()));
  gh.factory<_i5.EntriesRepository>(
      () => _i5.EntriesRepository(gh<_i4.EntriesRemoteDataSource>()));
  gh.factory<_i6.EntriesUseCase>(
      () => _i6.EntriesUseCase(gh<_i5.EntriesRepository>()));
  gh.factory<_i7.HomeCubit>(() => _i7.HomeCubit(gh<_i6.EntriesUseCase>()));
  gh.factoryParam<_i8.DetailCubit, _i9.EntryModel?, dynamic>((
    entry,
    _,
  ) =>
      _i8.DetailCubit(
        entry,
        gh<_i6.EntriesUseCase>(),
      ));
  return getIt;
}
