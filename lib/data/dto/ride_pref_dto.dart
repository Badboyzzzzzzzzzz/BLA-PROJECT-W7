import 'package:week_3_blabla_project/model/ride/ride_pref.dart';
import 'location_dto.dart';

class RidePreferenceDto {
  final RidePreference ridePreference;

  RidePreferenceDto(this.ridePreference);

  Map<String, dynamic> toJson() {
    return {
      'departure': LocationDto.toJson(ridePreference.departure),
      'departureDate': ridePreference.departureDate.toIso8601String(),
      'arrival': LocationDto.toJson(ridePreference.arrival),
      'requestedSeats': ridePreference.requestedSeats,
    };
  }

  static RidePreference fromJson(Map<String, dynamic> json) {
    return RidePreference(
      departure: LocationDto.fromJson(json['departure']),
      departureDate: DateTime.parse(json['departureDate']),
      arrival: LocationDto.fromJson(json['arrival']),
      requestedSeats: json['requestedSeats'],
    );
  }
}