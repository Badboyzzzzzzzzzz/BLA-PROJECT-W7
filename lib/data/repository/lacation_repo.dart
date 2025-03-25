import 'package:week_3_blabla_project/model/location/locations.dart';

abstract class LocationRepo {
  Future<List<Location>> getLocations();
}