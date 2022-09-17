part of 'mood_maker_bloc.dart';

abstract class MoodMakerEvent extends Equatable {
  const MoodMakerEvent();

  @override
  List<Object> get props => [];
}

class OnMakeMoodEvent extends MoodMakerEvent {
  final Map<String, dynamic> data;

  const OnMakeMoodEvent({
    this.data = const {},
  });

  @override
  List<Object> get props => [
        data,
      ];
}
