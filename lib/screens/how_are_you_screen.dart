import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/select_activity_screen.dart';
import 'package:com_nicodevelop_howareyou/services/mood_make/mood_maker_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Map<String, dynamic>> moods = [
  {"id": "happy", "icon": "😀"},
  {"id": "sad", "icon": "😢"},
  {"id": "angry", "icon": "😡"},
  {"id": "tired", "icon": "😴"},
  {"id": "bored", "icon": "😒"},
  {"id": "confused", "icon": "😕"},
  {"id": "surprised", "icon": "😮"},
  {"id": "scared", "icon": "😱"},
  {"id": "disgusted", "icon": "🤢"},
  {"id": "excited", "icon": "😆"},
  {"id": "lonely", "icon": "😞"},
  {"id": "proud", "icon": "😎"},
  {"id": "worried", "icon": "😟"},
  {"id": "jealous", "icon": "😒"},
  {"id": "hopeful", "icon": "🤞"},
  {"id": "anxious", "icon": "😰"},
  {"id": "frustrated", "icon": "😤"},
  {"id": "ashamed", "icon": "😳"},
  {"id": "guilty", "icon": "😔"},
  {"id": "nostalgic", "icon": "😢"},
  {"id": "sentimental", "icon": "😢"},
  {"id": "grateful", "icon": "😊"},
  {"id": "caring", "icon": "😊"},
  {"id": "loving", "icon": "😍"},
  {"id": "optimistic", "icon": "😊"},
];

class HowAreYouScreen extends StatelessWidget {
  const HowAreYouScreen({super.key});

  void _navigationToSelectActivity(BuildContext context) {
    context.read<MoodMakerBloc>().add(
          const OnCreateMoodEvent(data: {
            "mood": "happy",
          }),
        );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectActivityScreen(),
      ),
    );
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
                if (state is SettingsInitialState) {
                  return const Text('Initial state');
                }

                final UserModel userModel =
                    (state as SettingsLoadedState).userModel;

                return Text(
                  'Bonjour ${userModel.firstname} !',
                  style: Theme.of(context).textTheme.headline1,
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
              children: (moods..shuffle()).sublist(0, 3).map(
                (Map<String, dynamic> mood) {
                  return TextButton(
                    onPressed: () => _navigationToSelectActivity(context),
                    child: Text(
                      mood["icon"],
                      style: const TextStyle(
                        fontSize: 64,
                      ),
                    ),
                  );
                },
              ).toList(),

              // children: (moods..shuffle()).map((mood) {
              //   return GestureDetector(
              //     onTap: () => _navigationToSelectActivity(context),
              //     child: Column(
              //       children: [
              //         Text(
              //           mood["icon"],
              //           style: Theme.of(context).textTheme.headline3,
              //         ),
              //         Text(
              //           mood["id"],
              //           style: Theme.of(context).textTheme.headline4,
              //         ),
              //       ],
              //     ),
              //   );
              // }).toList(),

              // [
              //   TextButton(
              //     onPressed: () => _navigationToSelectActivity(context),
              //     child: const Text(
              //       '😀',
              //       style: TextStyle(
              //         fontSize: 64,
              //       ),
              //     ),
              //   ),
              //   TextButton(
              //     onPressed: () => _navigationToSelectActivity(context),
              //     child: const Text(
              //       '😐',
              //       style: TextStyle(
              //         fontSize: 64,
              //       ),
              //     ),
              //   ),
              //   TextButton(
              //     onPressed: () => _navigationToSelectActivity(context),
              //     child: const Text(
              //       '😔',
              //       style: TextStyle(
              //         fontSize: 64,
              //       ),
              //     ),
              //   ),
              // ],
            ),
          ],
        ),
      ),
    );
  }
}
