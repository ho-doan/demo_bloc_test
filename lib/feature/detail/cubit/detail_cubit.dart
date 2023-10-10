import 'package:bloc_ffff/core/data/models/entry.dart';
import 'package:bloc_ffff/core/domain/use_cases/entries_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(
    @factoryParam this.entry,
    this._entriesUseCase,
  ) : super(DetailInitial()) {
    onInit(entry);
  }
  final EntryModel? entry;
  // ignore: unused_field
  final EntriesUseCase _entriesUseCase;
  onInit(EntryModel? entry) async {
    emit(DetailLoading());
    await Future.delayed(const Duration(seconds: 3));
    if (entry != null) {
      emit(DetailSuccess(entry));
    } else {
      emit(const DetailFailure('Entry not found'));
    }
  }
}
