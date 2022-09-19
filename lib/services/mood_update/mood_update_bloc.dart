import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/repositories/mood_repository.dart';
import 'package:equatable/equatable.dart';

part 'mood_update_event.dart';
part 'mood_update_state.dart';

class MoodUpdateBloc extends Bloc<MoodUpdateEvent, MoodUpdateState> {
  final MoodRepository moodRepository;

  MoodUpdateBloc({
    required this.moodRepository,
  }) : super(MoodUpdateInitialState()) {
    on<OnUpdateMoodEvent>((event, emit) async {
      emit(MoodUpdateLoadingState());

      try {
        await moodRepository.update(event.mood);

        emit(MoodUpdateSuccessState());
      } catch (e) {
        emit(MoodUpdateErrorState(message: e.toString()));
      }
    });
  }
}
