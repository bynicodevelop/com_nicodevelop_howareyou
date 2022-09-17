import 'package:com_nicodevelop_howareyou/repositories/user_repository.dart';
import 'package:com_nicodevelop_howareyou/screens/thank_screen.dart';
import 'package:com_nicodevelop_howareyou/services/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Initialize the settings box
  final Box settingsBox = await Hive.openBox('user_settings_box');

  /// Récupère le fichier de configuration theme
  final themeStr = await rootBundle.loadString('assets/theme_config.json');

  /// Conversion du fichier en objet
  final themeJson = jsonDecode(themeStr);

  /// Conversion en theme Flutter
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(
    App(
      settingsBox: settingsBox,
      theme: theme,
    ),
  );
}

class App extends StatelessWidget {
  final Box settingsBox;
  final ThemeData theme;

  const App({
    super.key,
    required this.settingsBox,
    required this.theme,
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        home: const ThankScreen(),
      ),
    );
  }
}
