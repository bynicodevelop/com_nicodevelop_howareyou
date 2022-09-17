import 'package:com_nicodevelop_howareyou/repositories/user_repository.dart';
import 'package:com_nicodevelop_howareyou/screens/start_wizard_screen.dart';
import 'package:com_nicodevelop_howareyou/services/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();

  // Initialize the settings box
  final Box settingsBox = await Hive.openBox('user_settings_box');

  runApp(
    App(
      settingsBox: settingsBox,
    ),
  );
}

class App extends StatelessWidget {
  final Box settingsBox;

  const App({
    super.key,
    required this.settingsBox,
  });

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository(
      settingsBox: settingsBox,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(
            userRepository: userRepository,
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: StartWizardScreen(),
      ),
    );
  }
}
