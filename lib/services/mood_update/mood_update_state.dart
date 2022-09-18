part of 'mood_update_bloc.dart';

abstract class MoodUpdateState extends Equatable {
  const MoodUpdateState();

  @override
  List<Object> get props => [];
}

class MoodUpdateInitialState extends MoodUpdateState {}

class MoodUpdateLoadingState extends MoodUpdateState {}

class MoodUpdateSuccessState extends MoodUpdateState {}

class MoodUpdateErrorState extends MoodUpdateState {
  final String message;

  const MoodUpdateErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
