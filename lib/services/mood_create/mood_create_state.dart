part of 'mood_create_bloc.dart';

abstract class MoodCreateState extends Equatable {
  const MoodCreateState();

  @override
  List<Object> get props => [];
}

class MoodCreateInitialState extends MoodCreateState {}

class MoodCreateLoadingState extends MoodCreateState {}

class MoodCreateSuccessState extends MoodCreateState {}

class MoodCreateErrorState extends MoodCreateState {
  final String message;

  const MoodCreateErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
