part of 'mood_create_bloc.dart';

abstract class MoodCreateEvent extends Equatable {
  const MoodCreateEvent();

  @override
  List<Object> get props => [];
}

class OnCreateMoodEvent extends MoodCreateEvent {
  final Map<String, dynamic> data;

  const OnCreateMoodEvent({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}
