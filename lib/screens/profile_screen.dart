import 'package:com_nicodevelop_howareyou/config/contants.dart';
import 'package:com_nicodevelop_howareyou/services/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inputs_components/inputs_components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        bloc: context.read<SettingsBloc>()..add(OnGetUserSettingsEvent()),
        listener: (BuildContext context, SettingsState state) {
          if (state is SettingsLoadedState) {
            _firstNameController.text = state.userModel.firstname;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          child: Column(
            children: [
              standardInput(
                label: "Quel est votre prénom ?",
                errorText: "Avec un prénom, ça serait mieux 😀",
                controller: _firstNameController,
                customValidator: (value) => value.isNotEmpty,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    if (_firstNameController.text.isNotEmpty) {
                      context.read<SettingsBloc>().add(
                            OnUpdateUserSettingsEvent(user: {
                              "firstname": _firstNameController.text,
                            }),
                          );
                    }
                  },
                  child: const Text("C'est parti !"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
