part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class OnSetUserSettingsEvent extends SettingsEvent {
  final Map<String, dynamic> user;

  const OnSetUserSettingsEvent({
    required this.user,
  });

  @override
  List<Object> get props => [
        user,
      ];
}

class OnUpdateUserSettingsEvent extends SettingsEvent {
  final Map<String, dynamic> user;

  const OnUpdateUserSettingsEvent({
    required this.user,
  });

  @override
  List<Object> get props => [
        user,
      ];
}

class OnGetUserSettingsEvent extends SettingsEvent {}
