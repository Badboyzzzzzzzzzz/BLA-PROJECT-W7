import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:week_3_blabla_project/data/repository/lacation_repo.dart';
import 'package:week_3_blabla_project/model/location/locations.dart';

class LocationFirebaseRepository implements LocationRepo {
  final String _baseUrl = 'your-firebase-project-id.firebaseio.com';
  final String _path = 'location.json';

  Country _countryFromString(String countryName) {
    return Country.values.firstWhere(
      (c) => c.name == countryName,
      orElse: () => throw Exception('Unknown country: $countryName')
    );
  }

  @override
  Future<List<Location>> getLocations() async {
    try {
      final response = await http.get(Uri.https(_baseUrl, _path));
      
      if (response.statusCode != 200) {
        throw Exception('Failed to load locations: ${response.statusCode}');
      }

      final Map<String, dynamic> data = json.decode(response.body);
      return data.values.map((json) => Location(
        name: json['name'],
        country: _countryFromString(json['country'])
      )).toList();
      
    } catch (e) {
      throw Exception('Failed to fetch locations: $e');
    }
  }
}