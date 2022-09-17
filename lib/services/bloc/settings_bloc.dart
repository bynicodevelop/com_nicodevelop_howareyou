import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UserRepository userRepository;

  SettingsBloc({
    required this.userRepository,
  }) : super(SettingsInitial()) {
    on<OnSetUserSettingsEvent>((event, emit) async {
      await userRepository.create(event.user);

      print(await userRepository.get());
    });
  }
}
