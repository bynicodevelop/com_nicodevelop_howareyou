import 'package:flutter/material.dart';

class MoodDescriptionScreen extends StatelessWidget {
  const MoodDescriptionScreen({super.key});

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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: null,
                  minLines: 4,
                  decoration: InputDecoration(
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
                  onPressed: () {},
                  child: const Text("Button"),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Skip"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
