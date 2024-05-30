part of 'rocket_data_bloc.dart';

sealed class RocketDataState extends Equatable {
  const RocketDataState();
}

final class RocketDataInitial extends RocketDataState {
  @override
  List<Object> get props => [];
}

final class RocketDataLoading extends RocketDataState {
  @override
  List<Object> get props => [];
}

final class RocketDataLoaded extends RocketDataState {
  final List<RocketModel> rockets;

  const RocketDataLoaded({required this.rockets});

  @override
  List<Object> get props => [rockets];
}

final class RocketDataError extends RocketDataState {
  final String message;

  const RocketDataError({required this.message});

  @override
  List<Object> get props => [message];
}
