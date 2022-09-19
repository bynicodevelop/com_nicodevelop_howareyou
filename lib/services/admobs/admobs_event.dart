part of 'admobs_bloc.dart';

abstract class AdmobsEvent extends Equatable {
  const AdmobsEvent();

  @override
  List<Object> get props => [];
}

class OnShowAdmobsEvent extends AdmobsEvent {}
