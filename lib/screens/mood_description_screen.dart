import 'package:com_nicodevelop_howareyou/screens/thank_screen.dart';
import 'package:com_nicodevelop_howareyou/services/mood_make/mood_maker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoodDescriptionScreen extends StatefulWidget {
  const MoodDescriptionScreen({super.key});

  @override
  State<MoodDescriptionScreen> createState() => _MoodDescriptionScreenState();
}

class _MoodDescriptionScreenState extends State<MoodDescriptionScreen> {
  final TextEditingController _moodDescriptionController =
      TextEditingController();

  void _goToThankScreen(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ThankScreen(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          32.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _moodDescriptionController,
                  maxLines: null,
                  minLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Voulez-vous ajouter une quelque chose d'autre ?",
                    hintMaxLines: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<MoodMakerBloc>().add(
                          OnMakeMoodEvent(data: {
                            "description": _moodDescriptionController.text,
                          }),
                        );

                    _goToThankScreen(context);
                  },
                  child: const Text("Button"),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () => _goToThankScreen(context),
                child: const Text("Skip"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
