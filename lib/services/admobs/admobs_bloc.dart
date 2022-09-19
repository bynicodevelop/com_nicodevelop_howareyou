import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/repositories/mood_repository.dart';
import 'package:equatable/equatable.dart';

part 'admobs_event.dart';
part 'admobs_state.dart';

class AdmobsBloc extends Bloc<AdmobsEvent, AdmobsState> {
  final MoodRepository moodRepository;

  AdmobsBloc({
    required this.moodRepository,
  }) : super(AdmobsInitialState()) {
    on<OnShowAdmobsEvent>((event, emit) async {
      List<MoodModel> moods = await moodRepository.list();

      if (moods.length % 3 == 0) {
        emit(ShowAdmobsInitialState());
      } else {
        emit(UnShowAdmobsInitialState());
      }
    });
  }
}
