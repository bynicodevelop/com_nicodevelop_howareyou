import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/repositories/mood_repository.dart';
import 'package:equatable/equatable.dart';

part 'mood_list_event.dart';
part 'mood_list_state.dart';

class MoodListBloc extends Bloc<MoodListEvent, MoodListState> {
  final MoodRepository moodRepository;

  MoodListBloc({
    required this.moodRepository,
  }) : super(const MoodListInitialState()) {
    on<OnListMoodEvent>((event, emit) async {
      emit(MoodListInitialState(
        isLoading: true,
        moods: (state as MoodListInitialState).moods,
      ));

      try {
        final List<MoodModel> moodModels = await moodRepository.list();

        emit(MoodListInitialState(
          isLoading: false,
          moods: moodModels,
        ));
      } catch (e) {
        emit(MoodListErrorState(
          message: e.toString(),
        ));
      }
    });
  }
}
