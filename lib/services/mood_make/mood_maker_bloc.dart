import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mood_maker_event.dart';
part 'mood_maker_state.dart';

class MoodMakerBloc extends Bloc<MoodMakerEvent, MoodMakerState> {
  MoodMakerBloc() : super(const MoodMakerInitialState()) {
    on<OnMakeMoodEvent>((event, emit) {
      final Map<String, dynamic> data = {
        ...(state as MoodMakerInitialState).data,
        ...event.data
      };

      emit(MoodMakerInitialState(
        data: data,
      ));
    });
  }
}
