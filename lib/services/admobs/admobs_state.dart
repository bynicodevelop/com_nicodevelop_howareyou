part of 'admobs_bloc.dart';

abstract class AdmobsState extends Equatable {
  const AdmobsState();

  @override
  List<Object> get props => [];
}

class AdmobsInitialState extends AdmobsState {}

class ShowAdmobsInitialState extends AdmobsState {}

class UnShowAdmobsInitialState extends AdmobsState {}
