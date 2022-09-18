import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/feed_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/how_are_you_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/splash_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/start_wizard_screen.dart';
import 'package:com_nicodevelop_howareyou/services/bootstrap/bootstrap_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/mood_list/mood_list_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bootstrap extends StatefulWidget {
  const Bootstrap({
    super.key,
  });

  @override
  State<Bootstrap> createState() => _BootstrapState();
}

class _BootstrapState extends State<Bootstrap> {
  final ValueNotifier<bool> _isInitialized = ValueNotifier<bool>(false);
  final ValueNotifier<List<MoodModel>> _moods =
      ValueNotifier<List<MoodModel>>([]);
  final ValueNotifier<UserModel> _user =
      ValueNotifier<UserModel>(const UserModel(
    firstname: "",
  ));

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsLoadedState) {
          context.read<BootstrapBloc>().add(OnSettingsLoadedEvent());

          _user.value = state.userModel;
        }
      },
      child: BlocListener<MoodListBloc, MoodListState>(
        listener: (context, state) {
          final bool isLoading = (state as MoodListInitialState).isLoading;

          if (!isLoading) {
            context.read<BootstrapBloc>().add(OnMoodsLoadedEvent());

            _moods.value = state.moods;
          }
        },
        child: BlocConsumer<BootstrapBloc, BootstrapState>(
          listener: (context, state) {
            final BootstrapInitialState bootstrapState =
                state as BootstrapInitialState;

            if (!bootstrapState.isLoading) {
              _isInitialized.value = true;
            }
          },
          builder: (context, state) {
            if (!_isInitialized.value) {
              return const SplashScreen();
            }

            if (_user.value.isEmpty) {
              return const StartWizardScreen();
            }

            if (_moods.value.isEmpty) {
              return const HowAreYouScreen();
            }

            return const FeedScreen();
          },
        ),
      ),
    );
  }
}
