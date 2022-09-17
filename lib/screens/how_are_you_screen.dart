import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/select_activity_screen.dart';
import 'package:com_nicodevelop_howareyou/services/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HowAreYouScreen extends StatelessWidget {
  const HowAreYouScreen({super.key});

  void _navigationToSelectActivity(BuildContext context) {
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
              children: [
                TextButton(
                  onPressed: () => _navigationToSelectActivity(context),
                  child: const Text(
                    '😀',
                    style: TextStyle(
                      fontSize: 64,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _navigationToSelectActivity(context),
                  child: const Text(
                    '😐',
                    style: TextStyle(
                      fontSize: 64,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _navigationToSelectActivity(context),
                  child: const Text(
                    '😔',
                    style: TextStyle(
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
