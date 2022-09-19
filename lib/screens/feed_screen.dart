import 'package:com_nicodevelop_howareyou/components/update_mood/update_mood_component.dart';
import 'package:com_nicodevelop_howareyou/config/contants.dart';
import 'package:com_nicodevelop_howareyou/config/moods_contants.dart';
import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:com_nicodevelop_howareyou/screens/how_are_you_screen.dart';
import 'package:com_nicodevelop_howareyou/screens/settings_screen.dart';
import 'package:com_nicodevelop_howareyou/services/admobs/admobs_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/mood_list/mood_list_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  // Create modal bottom sheet
  void _updateMood(
    BuildContext context,
    MoodModel mood,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            kDefaultPadding,
          ),
        ),
      ),
      builder: (context) => UpdateMoodComponent(
        mood: mood,
      ),
    );
  }

  Widget _buildMoodItem(
    BuildContext context,
    MoodModel mood,
  ) =>
      GestureDetector(
        onTap: () => _updateMood(
          context,
          mood,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20.5,
              top: 0,
              bottom: 0,
              child: Container(
                width: 6.0,
                color: Theme.of(context).primaryColor.withOpacity(
                      0.3,
                    ),
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
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Text(
                      getFlatMoodsById(mood.mood)["icon"],
                      style: const TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding * .5,
                      ),
                      child: Text(
                        mood.description.isEmpty
                            ? "Vous avez choisi de ne pas décrire votre humeur"
                            : mood.description,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontStyle: mood.description.isEmpty
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                              color: mood.description.isEmpty
                                  ? Colors.grey
                                  : Colors.black,
                              height: 1.5,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Future<void> _showAdd() async {
    return InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          ad.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mood Feed',
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
          const SizedBox(
            width: kDefaultPadding,
          )
        ],
      ),
      body: BlocListener<AdmobsBloc, AdmobsState>(
        listener: (context, state) {
          if (state is ShowAdmobsInitialState) _showAdd();
        },
        child: BlocBuilder<MoodListBloc, MoodListState>(
          bloc: context.read<MoodListBloc>()..add(OnListMoodEvent()),
          builder: (context, state) {
            List<MoodModel> moods = (state as MoodListInitialState).moods;

            return ListView.builder(
              itemCount: moods.length,
              padding: const EdgeInsets.only(
                top: 50,
                left: kDefaultPadding * 2,
                right: kDefaultPadding * 2,
                bottom: kDefaultPadding,
              ),
              itemBuilder: (context, index) {
                if (index == moods.length - 1) {
                  return Column(
                    children: [
                      _buildMoodItem(
                        context,
                        moods[index],
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
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: const Text(
                                    "👋",
                                    style: TextStyle(
                                      fontSize: 36,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: kDefaultPadding,
                                ),
                                BlocBuilder<SettingsBloc, SettingsState>(
                                  builder: (context, state) {
                                    final UserModel userModel =
                                        (state as SettingsLoadedState)
                                            .userModel;

                                    return Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 6.0,
                                        ),
                                        child: Text(
                                          "Bienvenue ${userModel.firstname}",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }

                return _buildMoodItem(
                  context,
                  moods[index],
                );
              },
            );
          },
        ),
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
