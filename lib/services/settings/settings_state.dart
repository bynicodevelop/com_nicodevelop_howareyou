part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitialState extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  final UserModel userModel;

  const SettingsLoadedState({
    required this.userModel,
  });

  @override
  List<Object> get props => [
        userModel,
      ];
}

class SettingsUpdatedState extends SettingsState {}

class SettingsErrorState extends SettingsState {
  final String message;

  const SettingsErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
