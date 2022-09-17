import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/repositories/mood_repository.dart';
import 'package:equatable/equatable.dart';

part 'moods_event.dart';
part 'moods_state.dart';

class MoodsBloc extends Bloc<MoodsEvent, MoodsState> {
  final MoodRepository moodRepository;

  MoodsBloc({
    required this.moodRepository,
  }) : super(MoodsInitialState()) {
    on<MoodsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
