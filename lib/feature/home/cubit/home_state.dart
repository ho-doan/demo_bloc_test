part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {
  final String error;

  const HomeFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class HomeSuccess extends HomeState {
  final EntriesModel entries;

  const HomeSuccess(this.entries);

  @override
  List<Object> get props => [entries];
}
