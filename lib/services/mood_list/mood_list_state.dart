part of 'mood_list_bloc.dart';

abstract class MoodListState extends Equatable {
  const MoodListState();

  @override
  List<Object> get props => [];
}

class MoodListInitialState extends MoodListState {
  final bool isLoading;
  final List<MoodModel> moods;

  const MoodListInitialState({
    this.isLoading = true,
    this.moods = const [],
  });

  @override
  List<Object> get props => [
        isLoading,
        moods,
      ];
}

class MoodListErrorState extends MoodListState {
  final String message;

  const MoodListErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
