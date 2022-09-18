import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/feed_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/how_are_you_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/start_wizard_screen.dart';
import 'package:com_nicodevelop_howareyou/services/mood_list/mood_list_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bootstrap extends StatelessWidget {
  const Bootstrap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: context.read<SettingsBloc>()..add(OnGetUserSettingsEvent()),
      builder: (context, settingsState) {
        if (settingsState is! SettingsLoadedState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final UserModel userModel = settingsState.userModel;

        if (userModel.isEmpty) {
          return const StartWizardScreen();
        }

        return BlocBuilder<MoodListBloc, MoodListState>(
            bloc: context.read<MoodListBloc>()..add(OnListMoodEvent()),
            builder: (context, state) {
              final List<MoodModel> moods = state is MoodListInitialState
                  ? state.moods
                  : const <MoodModel>[];
              final bool isLoading =
                  state is MoodListInitialState ? state.isLoading : false;

              if (isLoading) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (moods.isEmpty) {
                return const HowAreYouScreen();
              } else {
                return const FeedScreen();
              }
            });
      },
    );
  }
}
