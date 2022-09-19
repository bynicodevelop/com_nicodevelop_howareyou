part of 'admobs_bloc.dart';

abstract class AdmobsState extends Equatable {
  const AdmobsState();

  @override
  List<Object> get props => [];
}

class AdmobsInitialState extends AdmobsState {}

class ShowAdmobsInitialState extends AdmobsState {
  final String adUnitId;

  const ShowAdmobsInitialState({
    required this.adUnitId,
  });

  @override
  List<Object> get props => [
        adUnitId,
      ];
}

class UnShowAdmobsInitialState extends AdmobsState {}
