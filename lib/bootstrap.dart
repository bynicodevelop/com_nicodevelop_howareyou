import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/how_are_you_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/start_wizard_screen.dart';
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
      builder: (context, state) {
        if (state is! SettingsLoadedState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final UserModel userModel = state.userModel;

        if (userModel.isEmpty) {
          return const StartWizardScreen();
        } else {
          return const HowAreYouScreen();
        }
      },
    );
  }
}
