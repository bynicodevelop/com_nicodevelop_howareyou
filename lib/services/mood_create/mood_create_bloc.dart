import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/repositories/mood_repository.dart';
import 'package:equatable/equatable.dart';

part 'mood_create_event.dart';
part 'mood_create_state.dart';

class MoodCreateBloc extends Bloc<MoodCreateEvent, MoodCreateState> {
  final MoodRepository moodRepository;

  MoodCreateBloc({
    required this.moodRepository,
  }) : super(MoodCreateInitialState()) {
    on<OnCreateMoodEvent>((event, emit) async {
      emit(MoodCreateLoadingState());

      try {
        await moodRepository.create(event.data);

        emit(MoodCreateSuccessState());
      } catch (e) {
        print(e);
        emit(MoodCreateErrorState(
          message: e.toString(),
        ));
      }
    });
  }
}
