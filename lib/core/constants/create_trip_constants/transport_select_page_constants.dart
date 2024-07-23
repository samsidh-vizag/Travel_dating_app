import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transport_select_page_constants.g.dart';

class TransportSelectPageConstants {
  final String txtSelect = 'Select Your Transport';
  final String txtCar = 'Car';
  final String txtBike = 'Bike';
  final String txtCycle = 'Cycle';
  final String txtTaxi = 'Taxi';
  final String txtAvailable = 'Available Cars For Ride';
  final String txtViewDetails = 'View Details';
  final String txtNearThe = 'Cars founds near the location';
}

@riverpod
TransportSelectPageConstants transportSelectPageConstants(
    TransportSelectPageConstantsRef ref) {
  return TransportSelectPageConstants();
}
