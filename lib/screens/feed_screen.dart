import 'package:com_nicodevelop_howareyou/config/moods_contants.dart';
import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/how_are_you_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/settings_screen.dart';
import 'package:com_nicodevelop_howareyou/services/mood_list/mood_list_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feed',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        bloc: context.read<SettingsBloc>()..add(OnGetUserSettingsEvent()),
        builder: (context, settingState) {
          return BlocBuilder<MoodListBloc, MoodListState>(
            bloc: context.read<MoodListBloc>()..add(OnListMoodEvent()),
            builder: (context, state) {
              final UserModel userModel =
                  (settingState as SettingsLoadedState).userModel;
              List<MoodModel> moods = (state as MoodListInitialState).moods;

              return ListView.builder(
                itemCount: moods.length,
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 32,
                  right: 32,
                  bottom: 16.0,
                ),
                itemBuilder: (context, index) {
                  if (index == moods.length - 1) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              left: 20.5,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                width: 6.0,
                                color: Colors.grey[300],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 72.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 23.0,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    child: Text(
                                      getFlatMoodsById(
                                          moods[index].mood)["icon"],
                                      style: const TextStyle(
                                        fontSize: 36,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 6.0,
                                      ),
                                      child: Text(
                                        moods[index].description,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 72.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 23.0,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    child: const Text(
                                      "👋",
                                      style: TextStyle(
                                        fontSize: 36,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 6.0,
                                      ),
                                      child: Text(
                                        "Bienvenue ${userModel.firstname}",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }

                  return Stack(
                    children: [
                      Positioned(
                        left: 20.5,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 6.0,
                          color: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 72.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 23.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Text(
                                getFlatMoodsById(moods[index].mood)["icon"],
                                style: const TextStyle(
                                  fontSize: 36,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 6.0,
                                ),
                                child: Text(
                                  moods[index].description,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HowAreYouScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
