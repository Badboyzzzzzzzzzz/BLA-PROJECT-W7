import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_3_blabla_project/data/dto/ride_pref_dto.dart';
import 'package:week_3_blabla_project/data/repository/ride_preferences_repository.dart';
import 'package:week_3_blabla_project/model/ride/ride_pref.dart';

class LocalRidePreferenceRepository extends RidePreferencesRepository {
  static const String _preferencesKey = "ride_preferences";

  @override
  Future<List<RidePreference>> getPastPreferences() async {
    // Get the preferences from the local storage
    final prefs = await SharedPreferences.getInstance();
    final prefsList = prefs.getStringList(_preferencesKey) ?? [];

    // Convert the string list to a list of RidePreferences – Using map()
    return prefsList
        .map((json) => RidePreferenceDto.fromJson(jsonDecode(json)))
        .toList();
  }

  @override
  Future<void> addPreference(RidePreference pref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<RidePreference> preferences = await getPastPreferences();

    preferences.add(pref);

    // Save the new list as a string list
    await prefs.setStringList(
      _preferencesKey,
      preferences
          .map((pref) => jsonEncode(RidePreferenceDto(pref).toJson()))
          .toList(),
    );
  }
}