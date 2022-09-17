part of 'moods_bloc.dart';

abstract class MoodsState extends Equatable {
  const MoodsState();

  @override
  List<Object> get props => [];
}

class MoodsInitialState extends MoodsState {}
