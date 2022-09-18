import 'package:com_nicodevelop_howareyou/bootstrap.dart';
import 'package:com_nicodevelop_howareyou/repositories/mood_repository.dart';
import 'package:com_nicodevelop_howareyou/repositories/user_repository.dart';
import 'package:com_nicodevelop_howareyou/services/mood_create/mood_create_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/mood_list/mood_list_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/mood_make/mood_maker_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
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
  final Box moodsBox = await Hive.openBox('moods_box');

  await settingsBox.clear();
  await moodsBox.clear();

  /// Récupère le fichier de configuration theme
  final themeStr = await rootBundle.loadString('assets/theme_config.json');

  /// Conversion du fichier en objet
  final themeJson = jsonDecode(themeStr);

  /// Conversion en theme Flutter
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(
    App(
      settingsBox: settingsBox,
      moodsBox: moodsBox,
      theme: theme,
    ),
  );
}

class App extends StatelessWidget {
  final Box settingsBox;
  final Box moodsBox;
  final ThemeData theme;

  const App({
    super.key,
    required this.settingsBox,
    required this.moodsBox,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository(
      settingsBox: settingsBox,
    );

    final MoodRepository moodRepository = MoodRepository(
      moodsBox: moodsBox,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(
            userRepository: userRepository,
          ),
        ),
        BlocProvider(
          create: (context) => MoodListBloc(
            moodRepository: moodRepository,
          ),
        ),
        BlocProvider<MoodMakerBloc>(
          create: (context) => MoodMakerBloc(),
        ),
        BlocProvider<MoodCreateBloc>(
          create: (context) => MoodCreateBloc(
            moodRepository: moodRepository,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        home: const Bootstrap(),
      ),
    );
  }
}
