import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_overview_page_constants.g.dart';

class VehicleOverviewPageConstants {
  final String txtVehicleDetails = 'vehicle details';
  final String txtVehicleFeaturse = 'Vehicle Feature';
  final String txtModel = 'Model';
  final String txtCapacity = 'Capacity';
  final String txtColor = 'Color';
  final String txtFuelType = 'Fuel Type';
  final String txtSpeed = 'Speed';
  final String txtPower = 'power';
  final String txtSelect = 'Select';
  final String txtCancel = 'Cancel';
}

@riverpod
VehicleOverviewPageConstants vehicleOverviewPageConstants(
    VehicleOverviewPageConstantsRef ref) {
  return VehicleOverviewPageConstants();
}
