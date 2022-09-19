import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:com_nicodevelop_howareyou/repositories/mood_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'admobs_event.dart';
part 'admobs_state.dart';

class AdmobsBloc extends Bloc<AdmobsEvent, AdmobsState> {
  final MoodRepository moodRepository;
  final Map<String, dynamic> admobJson;

  AdmobsBloc({
    required this.moodRepository,
    required this.admobJson,
  }) : super(AdmobsInitialState()) {
    on<OnShowAdmobsEvent>((event, emit) async {
      List<MoodModel> moods = await moodRepository.list();

      final String adUnitId = kDebugMode
          ? admobJson["devUnitId"]
          : Platform.isAndroid
              ? admobJson["androidUnitType"]
              : admobJson["iosUnitName"];

      print(adUnitId);

      if (moods.length % 3 == 0) {
        emit(ShowAdmobsInitialState(
          adUnitId: adUnitId,
        ));
      } else {
        emit(UnShowAdmobsInitialState());
      }
    });
  }
}
