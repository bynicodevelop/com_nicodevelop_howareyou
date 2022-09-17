import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/repositories/mood_repository.dart';
import 'package:equatable/equatable.dart';

part 'mood_maker_event.dart';
part 'mood_maker_state.dart';

class MoodMakerBloc extends Bloc<MoodMakerEvent, MoodMakerState> {
  final MoodRepository moodRepository;

  MoodMakerBloc({
    required this.moodRepository,
  }) : super(const MoodMakerInitialState()) {
    on<OnCreateMoodEvent>((event, emit) {
      print(event.data);
    });
  }
}
