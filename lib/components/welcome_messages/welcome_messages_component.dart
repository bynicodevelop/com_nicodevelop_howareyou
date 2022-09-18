import 'package:flutter/material.dart';

class WelcomeMessagesComponent extends StatelessWidget {
  final String name;

  const WelcomeMessagesComponent({
    super.key,
    required this.name,
  });

  String _getMessage(int hour) {
    if (hour >= 5 && hour < 12) {
      return 'Good morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    final String message = _getMessage(now.hour);

    return Text(
      '$message $name',
      style: Theme.of(context).textTheme.headline1!.copyWith(
            height: 1.3,
          ),
      textAlign: TextAlign.center,
    );
  }
}
