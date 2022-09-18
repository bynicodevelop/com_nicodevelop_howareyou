import 'package:flutter/material.dart';

class WelcomeMessagesComponent extends StatelessWidget {
  final String name;

  const WelcomeMessagesComponent({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    if (now.hour < 12) {
      return Text(
        'Bonjour $name',
        style: Theme.of(context).textTheme.headline1,
      );
    } else if (now.hour < 18) {
      return Text(
        'Bon après-midi $name',
        style: Theme.of(context).textTheme.headline1,
      );
    } else {
      return Text(
        'Bonsoir $name',
        style: Theme.of(context).textTheme.headline1,
      );
    }
  }
}
