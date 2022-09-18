import 'package:com_nicodevelop_howareyou/components/buttons/main_button_component.dart';
import 'package:com_nicodevelop_howareyou/config/contants.dart';
import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/services/mood_list/mood_list_bloc.dart';
import 'package:com_nicodevelop_howareyou/services/mood_update/mood_update_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateMoodComponent extends StatefulWidget {
  final MoodModel mood;

  const UpdateMoodComponent({
    super.key,
    required this.mood,
  });

  @override
  State<UpdateMoodComponent> createState() => _UpdateMoodComponentState();
}

class _UpdateMoodComponentState extends State<UpdateMoodComponent> {
  final TextEditingController _moodDescriptionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    _moodDescriptionController.text = widget.mood.description;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MoodUpdateBloc, MoodUpdateState>(
      listener: (context, state) {
        if (state is MoodUpdateSuccessState) {
          context.read<MoodListBloc>().add(OnListMoodEvent());

          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(
          kDefaultPadding,
        ),
        child: SizedBox(
          height: 300,
          child: Wrap(
            children: [
              Text(
                "Modifiez votre humeur",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: kDefaultPadding,
                width: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _moodDescriptionController,
                    maxLines: null,
                    minLines: 4,
                    decoration: const InputDecoration(
                      hintText:
                          "Voulez-vous ajouter une quelque chose d'autre ?",
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
                        context.read<MoodUpdateBloc>().add(OnUpdateMoodEvent(
                              mood: widget.mood.copyWith(
                                description: _moodDescriptionController.text,
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
