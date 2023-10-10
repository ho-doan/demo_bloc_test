import 'package:bloc_ffff/core/data/models/entries.dart';
import 'package:bloc_ffff/core/data/models/entry.dart';
import 'package:bloc_ffff/core/domain/use_cases/entries_use_case.dart';
import 'package:bloc_ffff/core/services/dependency_injection/service_locator.dart';
import 'package:bloc_ffff/feature/home/cubit/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

const entries = EntriesModel(count: 1, entries: [
  EntryModel(),
]);

@GenerateMocks([EntriesUseCase, HomeCubit])
void main() {
  group('home bloc', () {
    final mockEntriesUseCase = MockEntriesUseCase();
    blocTest<HomeCubit, HomeState>(
      'when success',
      setUp: () {
        configureDependenciesTest();
        getIt.unregister<EntriesUseCase>();
        getIt.registerFactory<EntriesUseCase>(() => mockEntriesUseCase);
      },
      tearDown: () => getIt.reset(),
      build: () {
        when(mockEntriesUseCase.entries()).thenAnswer(
          (_) async => const Right(entries),
        );
        return getIt<HomeCubit>();
      },
      act: (cubit) => cubit.onInit(),
      expect: () => [
        isA<HomeLoading>(),
        const HomeSuccess(entries),
      ],
    );
    blocTest<HomeCubit, HomeState>(
      'when delete success',
      setUp: () {
        configureDependenciesTest();
        getIt.unregister<EntriesUseCase>();
        getIt.registerFactory<EntriesUseCase>(() => mockEntriesUseCase);
      },
      tearDown: () => getIt.reset(),
      build: () {
        when(mockEntriesUseCase.entries()).thenAnswer(
          (_) async => const Right(entries),
        );
        return getIt<HomeCubit>();
      },
      act: (cubit) async {
        await cubit.onInit();
        return cubit.delete(0);
      },
      expect: () => [
        isA<HomeLoading>(),
        const HomeSuccess(entries),
        const HomeSuccess(EntriesModel(count: 0, entries: [])),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'when failure',
      setUp: () {
        configureDependenciesTest();
        getIt.unregister<EntriesUseCase>();
        getIt.registerFactory<EntriesUseCase>(() => mockEntriesUseCase);
      },
      tearDown: () => getIt.reset(),
      build: () {
        when(mockEntriesUseCase.entries()).thenAnswer(
          (_) async => throw Exception(),
        );
        return getIt<HomeCubit>();
      },
      act: (cubit) => cubit.onInit(),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeFailure>(),
      ],
    );
  });
}
