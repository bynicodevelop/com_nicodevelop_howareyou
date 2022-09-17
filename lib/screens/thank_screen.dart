import 'package:com_nicodevelop_howareyou/models/user_model.dart';
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
                height: 16.0,
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
                height: 16.0,
              ),
              Text(
                'Vous venez de poster votre première humeur.',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
