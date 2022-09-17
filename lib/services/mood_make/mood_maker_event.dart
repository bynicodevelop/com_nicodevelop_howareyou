part of 'mood_maker_bloc.dart';

abstract class MoodMakerEvent extends Equatable {
  const MoodMakerEvent();

  @override
  List<Object> get props => [];
}

class OnCreateMoodEvent extends MoodMakerEvent {
  final Map<String, dynamic> data;

  const OnCreateMoodEvent({
    this.data = const {},
  });

  @override
  List<Object> get props => [
        data,
      ];
}
