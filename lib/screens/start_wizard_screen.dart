import 'package:flutter/material.dart';
import 'package:inputs_components/inputs_components.dart';

class StartWizardScreen extends StatefulWidget {
  const StartWizardScreen({Key? key}) : super(key: key);

  @override
  State<StartWizardScreen> createState() => _StartWizardScreenState();
}

class _StartWizardScreenState extends State<StartWizardScreen> {
  final TextEditingController _firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Un prénom et c'est parti !"),
              standardInput(
                label: "Quel est votre prénom ?",
                controller: _firstNameController,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("C'est parti !"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
