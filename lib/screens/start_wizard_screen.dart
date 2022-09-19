import 'package:com_nicodevelop_howareyou/components/buttons/main_button_component.dart';
import 'package:com_nicodevelop_howareyou/config/contants.dart';
import 'package:com_nicodevelop_howareyou/screens/how_are_you_screen.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:inputs_components/inputs_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Un prénom et c'est parti !",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                standardInput(
                  label: "Quel est votre prénom ?",
                  errorText: "Avec un prénom, ça serait mieux 😀",
                  controller: _firstNameController,
                  customValidator: (value) => value.isNotEmpty,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                SizedBox(
                  width: double.infinity,
                  child: BlocListener<SettingsBloc, SettingsState>(
                    listener: (context, state) {
                      if (state is SettingsUpdatedState) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HowAreYouScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    child: MainButtonComponent(
                      text: "C'est parti !",
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        if (_firstNameController.text.isNotEmpty) {
                          context.read<SettingsBloc>().add(
                                OnSetUserSettingsEvent(user: {
                                  "firstname": _firstNameController.text,
                                }),
                              );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
