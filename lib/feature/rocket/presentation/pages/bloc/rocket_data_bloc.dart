import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:novus_logic/feature/rocket/data/repositories/rocket_repository_impl.dart';

import '../../../data/models/rocket_model.dart';
import '../../../domain/repositories/rocket_repository.dart';

part 'rocket_data_event.dart';

part 'rocket_data_state.dart';

class RocketDataBloc extends Bloc<RocketDataEvent, RocketDataState> {
  final RocketRepository rocketRepository;

  RocketDataBloc({required this.rocketRepository})
      : super(RocketDataInitial()) {
    on<RocketDataEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetRockets>((event, emit) async {
      emit(RocketDataLoading());
      try {
        debugPrint('GetRockets called');
        final rockets = await RocketRepositoryImpl().getRockets();
        debugPrint('rockets: $rockets');
        emit(RocketDataLoaded(rockets: rockets));
      } catch (e) {
        emit(RocketDataError(message: e.toString()));
      }
    });
  }
}
