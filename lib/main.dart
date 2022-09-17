import 'package:com_nicodevelop_howareyou/screens/start_wizard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Aoo());
}

class Aoo extends StatelessWidget {
  const Aoo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StartWizardScreen(),
    );
  }
}
