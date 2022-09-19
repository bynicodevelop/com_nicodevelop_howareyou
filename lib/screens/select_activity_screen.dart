import 'package:com_nicodevelop_howareyou/config/contants.dart';
import 'package:com_nicodevelop_howareyou/screens/mood_description_screen.dart';
import "package:com_nicodevelop_howareyou/services/mood_make/mood_maker_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

const List<Map<String, dynamic>> activities = [
  {"icon": Icons.directions_bike, "id": "bike", "name": "Bike"},
  {"icon": Icons.directions_run, "id": "run", "name": "Run"},
  {"icon": Icons.directions_walk, "id": "walk", "name": "Walk"},
  {"icon": Icons.directions_boat, "id": "boat", "name": "Boat"},
  {"icon": Icons.directions_bus, "id": "bus", "name": "Bus"},
  {"icon": Icons.directions_car, "id": "car", "name": "Car"},
  {"icon": Icons.work, "id": "work", "name": "Work"},
  {"icon": Icons.travel_explore, "id": "travel", "name": "Travel"},
  {"icon": Icons.book, "id": "book", "name": "Book"},
  {"icon": Icons.kitchen, "id": "to_cook", "name": "To Cook"},
  {"icon": Icons.park_outlined, "id": "garden", "name": "Garden"},
];

class SelectActivityScreen extends StatelessWidget {
  const SelectActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          kDefaultPadding,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quelle activité êtes-vous en train de faire ?",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: activities.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        context.read<MoodMakerBloc>().add(
                              OnMakeMoodEvent(
                                data: {
                                  "activity": activities[index],
                                },
                              ),
                            );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MoodDescriptionScreen(),
                          ),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              activities[index]["icon"],
                              size: 50,
                              color: Theme.of(context).primaryColor.withOpacity(
                                    0.8,
                                  ),
                            ),
                            const SizedBox(
                              height: kDefaultPadding * .2,
                            ),
                            Text(
                              activities[index]["name"],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
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
