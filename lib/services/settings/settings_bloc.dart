import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UserRepository userRepository;

  SettingsBloc({
    required this.userRepository,
  }) : super(SettingsInitialState()) {
    on<OnGetUserSettingsEvent>((event, emit) async {
      final UserModel userModel = await userRepository.get();

      emit(SettingsLoadedState(
        userModel: userModel,
      ));
    });

    on<OnSetUserSettingsEvent>((event, emit) async {
      await userRepository.create(event.user);

      emit(SettingsUpdatedState());
    });
  }
}
