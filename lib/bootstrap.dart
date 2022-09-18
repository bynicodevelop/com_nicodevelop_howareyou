import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/feed_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/splash_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/start_wizard_screen.dart';
import 'package:com_nicodevelop_howareyou/services/bootstrap/bootstrap_bloc.dart';
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
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsLoadedState) {
          context.read<BootstrapBloc>().add(OnSettingsLoadedEvent());
        }
      },
      builder: (context, settingsState) {
        return BlocConsumer<MoodListBloc, MoodListState>(
          listener: (context, state) {
            final bool isLoading = (state as MoodListInitialState).isLoading;

            if (!isLoading) {
              context.read<BootstrapBloc>().add(OnMoodsLoadedEvent());
            }
          },
          builder: (context, moodState) {
            return BlocBuilder<BootstrapBloc, BootstrapState>(
                builder: (context, state) {
              final BootstrapInitialState bootstrapState =
                  state as BootstrapInitialState;

              if (bootstrapState.isLoading) {
                return const SplashScreen();
              }

              final UserModel userModel =
                  (settingsState as SettingsLoadedState).userModel;

              if (userModel.isEmpty) {
                return const StartWizardScreen();
              }

              return const FeedScreen();
            });
          },
        );
      },
    );
  }
}
