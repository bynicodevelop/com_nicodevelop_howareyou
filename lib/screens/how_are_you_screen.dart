import 'package:com_nicodevelop_howareyou/components/welcome_messages/welcome_messages_component.dart';
import 'package:com_nicodevelop_howareyou/config/moods_contants.dart';
import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/select_activity_screen.dart';
import 'package:com_nicodevelop_howareyou/services/mood_make/mood_maker_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HowAreYouScreen extends StatefulWidget {
  const HowAreYouScreen({super.key});

  @override
  State<HowAreYouScreen> createState() => _HowAreYouScreenState();
}

class _HowAreYouScreenState extends State<HowAreYouScreen> {
  void _navigationToSelectActivity(
    BuildContext context,
    Map<String, dynamic> mood,
  ) {
    context.read<MoodMakerBloc>().add(
          OnMakeMoodEvent(data: {
            "mood": mood,
          }),
        );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectActivityScreen(),
      ),
    );
  }

  late Map<String, dynamic> _happyMoodStatus;
  late Map<String, dynamic> _sosoMoodStatus;
  late Map<String, dynamic> _sadMoodStatus;

  @override
  void initState() {
    super.initState();

    _happyMoodStatus = (moods["happy"]..shuffle()).first;
    _sosoMoodStatus = (moods["soso"]..shuffle()).first;
    _sadMoodStatus = (moods["sad"]..shuffle()).first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SettingsBloc, SettingsState>(
              bloc: context.read<SettingsBloc>()..add(OnGetUserSettingsEvent()),
              builder: (context, state) {
                if (state is! SettingsLoadedState) {
                  return const Text('Initial state');
                }

                final UserModel userModel = state.userModel;

                return WelcomeMessagesComponent(
                  name: userModel.firstname,
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Comment allez-vous ?',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // Create 3 mood text buttons from shuffled moods
              children: [
                TextButton(
                  onPressed: () => _navigationToSelectActivity(
                    context,
                    _happyMoodStatus,
                  ),
                  child: Text(
                    _happyMoodStatus["icon"],
                    style: const TextStyle(
                      fontSize: 64,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _navigationToSelectActivity(
                    context,
                    _sosoMoodStatus,
                  ),
                  child: Text(
                    _sosoMoodStatus["icon"],
                    style: const TextStyle(
                      fontSize: 64,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _navigationToSelectActivity(
                    context,
                    _sadMoodStatus,
                  ),
                  child: Text(
                    _sadMoodStatus["icon"],
                    style: const TextStyle(
                      fontSize: 64,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
