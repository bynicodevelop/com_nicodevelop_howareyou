import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bootstrap_event.dart';
part 'bootstrap_state.dart';

class BootstrapBloc extends Bloc<BootstrapEvent, BootstrapState> {
  BootstrapBloc()
      : super(const BootstrapInitialState(loadedStates: {
          "services": false,
          "moods": false,
        })) {
    on<OnSettingsLoadedEvent>((event, emit) {
      log("OnSettingsLoadedEvent");

      final Map<String, bool> loadedStates = {
        "services": true,
        "moods": (state as BootstrapInitialState).loadedStates["moods"]!,
      };

      emit(BootstrapInitialState(
        loadedStates: loadedStates,
        isLoading: loadedStates.values.contains(false),
      ));
    });

    on<OnMoodsLoadedEvent>((event, emit) {
      log("OnMoodsLoadedEvent");

      final Map<String, bool> loadedStates = {
        "services": (state as BootstrapInitialState).loadedStates["services"]!,
        "moods": true,
      };

      emit(BootstrapInitialState(
        loadedStates: loadedStates,
        isLoading: loadedStates.values.contains(false),
      ));
    });
  }
}
