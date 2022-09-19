part of 'mood_update_bloc.dart';

abstract class MoodUpdateEvent extends Equatable {
  const MoodUpdateEvent();

  @override
  List<Object> get props => [];
}

class OnUpdateMoodEvent extends MoodUpdateEvent {
  final MoodModel mood;

  const OnUpdateMoodEvent({
    required this.mood,
  });

  @override
  List<Object> get props => [
        mood,
      ];
}
