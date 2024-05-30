part of 'rocket_data_bloc.dart';

sealed class RocketDataEvent extends Equatable {
  const RocketDataEvent();
}

final class GetRockets extends RocketDataEvent {
  const GetRockets();

  @override
  List<Object> get props => [];
}
