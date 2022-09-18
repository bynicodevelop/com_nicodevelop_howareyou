import 'package:com_nicodevelop_howareyou/config/contants.dart';
import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/feed_screen.dart';
import 'package:com_nicodevelop_howareyou/services/mood_create/mood_create_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/mood_make/mood_maker_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThankScreen extends StatelessWidget {
  const ThankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '👏',
                style: TextStyle(
                  fontSize: 72,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              BlocBuilder<SettingsBloc, SettingsState>(
                bloc: context.read<SettingsBloc>()
                  ..add(OnGetUserSettingsEvent()),
                builder: (context, state) {
                  if (state is SettingsInitialState) {
                    return const Text('Initial state');
                  }

                  final UserModel userModel =
                      (state as SettingsLoadedState).userModel;

                  return Text(
                    'Félicications ${userModel.firstname} !',
                    style: Theme.of(context).textTheme.headline1,
                  );
                },
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "Il ne vous reste plus qu'à valider tout ça.",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              BlocBuilder<MoodMakerBloc, MoodMakerState>(
                builder: (context, stateMaker) {
                  return BlocListener<MoodCreateBloc, MoodCreateState>(
                    listener: (context, state) {
                      if (state is MoodCreateSuccessState) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const FeedScreen()),
                          ),
                          (route) => false,
                        );
                      }

                      if (state is MoodCreateErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    child: TextButton(
                      onPressed: () {
                        context.read<MoodCreateBloc>().add(
                              OnCreateMoodEvent(
                                data:
                                    (stateMaker as MoodMakerInitialState).data,
                              ),
                            );
                      },
                      child: const Text(
                        "Valider",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
