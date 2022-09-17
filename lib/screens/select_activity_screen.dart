import 'package:flutter/material.dart';

const List<Map<String, dynamic>> icons = [
  {
    'icon': Icons.directions_bike,
    'title': 'Bike',
  },
  {
    'icon': Icons.directions_run,
    'title': 'Run',
  },
  {
    'icon': Icons.directions_walk,
    'title': 'Walk',
  },
  {
    'icon': Icons.directions_boat,
    'title': 'Boat',
  },
  {
    'icon': Icons.directions_bus,
    'title': 'Bus',
  },
  {
    'icon': Icons.directions_car,
    'title': 'Car',
  },
  {
    'icon': Icons.work,
    'title': 'Work',
  },
  {
    'icon': Icons.travel_explore,
    'title': 'Travel',
  },
  {
    'icon': Icons.book,
    'title': 'Book',
  },
  {
    'icon': Icons.kitchen,
    'title': 'To Cook',
  },
];

class SelectActivityScreen extends StatelessWidget {
  const SelectActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quelle activité êtes-vous en train de faire ?',
              style: Theme.of(context).textTheme.headline2,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: icons.length,
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
                    onTap: () => print("tapped"),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            icons[index]['icon'],
                            size: 50,
                          ),
                          Text(icons[index]['title']),
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
    );
  }
}
