import 'package:bloc_ffff/core/data/models/base_model.dart';
import 'package:bloc_ffff/core/data/models/entries.dart';
import 'package:bloc_ffff/core/data/models/entry.dart';
import 'package:bloc_ffff/core/domain/use_cases/entries_use_case.dart';
import 'package:bloc_ffff/feature/detail/detail_page.dart';
import 'package:bloc_ffff/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

extension on Cubit {
  GlobalKey<NavigatorState> get key => navigatorKey;
  BuildContext get context => key.currentContext!;
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._entriesUseCase) : super(HomeInitial()) {
    // onInit();
  }
  final EntriesUseCase _entriesUseCase;
  Future<void> onInit() async {
    emit(HomeLoading());
    try {
      final data = await _entriesUseCase.entries();
      data.fold(
        (l) => emit(HomeFailure(l.error)),
        (r) => emit(HomeSuccess(r)),
      );
    } catch (e) {
      emit(HomeFailure(BaseException.onObject(e).error));
    }
  }

  void delete(int index) {
    if (state is HomeSuccess) {
      final s = state as HomeSuccess;
      final newState = HomeSuccess(EntriesModel(
        count: s.entries.count - 1,
        entries: List.from(s.entries.entries)..removeAt(index),
      ));
      emit(newState);
    }
  }

  onPushDetail(EntryModel? entry) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => detailPage(entry)),
    );
  }
}
