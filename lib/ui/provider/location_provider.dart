import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/data/repository/lacation_repo.dart';
import 'package:week_3_blabla_project/model/location/locations.dart';

class LocationProvider extends ChangeNotifier{
  
  final LocationRepo? _repository;
  List<Location> _locations = [];
  Exception? _error;

  LocationProvider(this._repository);

  List<Location> get locations => _locations;
  Exception? get error => _error;

  Future<void> fetchLocations() async {
    try {
      _locations = await _repository!.getLocations();
      _error = null;
    } catch (e) {
      _error = e as Exception;
      _locations = [];
    }
    notifyListeners();
  }
}
