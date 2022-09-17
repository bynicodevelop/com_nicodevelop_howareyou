part of 'mood_list_bloc.dart';

abstract class MoodListEvent extends Equatable {
  const MoodListEvent();

  @override
  List<Object> get props => [];
}

class OnListMoodEvent extends MoodListEvent {}
