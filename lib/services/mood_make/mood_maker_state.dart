part of 'mood_maker_bloc.dart';

abstract class MoodMakerState extends Equatable {
  const MoodMakerState();

  @override
  List<Object> get props => [];
}

class MoodMakerInitialState extends MoodMakerState {
  final Map<String, dynamic> data;

  const MoodMakerInitialState({
    this.data = const {},
  });

  MoodMakerInitialState copyWith({
    Map<String, dynamic>? data,
  }) =>
      MoodMakerInitialState(
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [
        data,
      ];
}
