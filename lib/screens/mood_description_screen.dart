import 'package:com_nicodevelop_howareyou/components/buttons/main_button_component.dart';
import 'package:com_nicodevelop_howareyou/config/contants.dart';
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
          kDefaultPadding * 2,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _moodDescriptionController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                minLines: 4,
                decoration: const InputDecoration(
                  hintText: "Voulez-vous ajouter une quelque chose d'autre ?",
                  hintMaxLines: 2,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              SizedBox(
                width: double.infinity,
                child: MainButtonComponent(
                  text: "Continuer",
                  onPressed: () {
                    context.read<MoodMakerBloc>().add(
                          OnMakeMoodEvent(data: {
                            "description": _moodDescriptionController.text,
                          }),
                        );

                    _goToThankScreen(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
