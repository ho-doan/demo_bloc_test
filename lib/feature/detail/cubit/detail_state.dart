part of 'detail_cubit.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

final class DetailLoading extends DetailState {}

final class DetailFailure extends DetailState {
  final String error;

  const DetailFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class DetailSuccess extends DetailState {
  final EntryModel entry;

  const DetailSuccess(this.entry);

  @override
  List<Object> get props => [entry];
}
