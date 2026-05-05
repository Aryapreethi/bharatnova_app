import 'package:flutter/material.dart';
import '../data/services/location_service.dart';

class LocationProvider extends ChangeNotifier {
  String? city;
  bool isLoading = false;

  Future<void> fetchCity() async {
    isLoading = true;
    notifyListeners();

    city = await LocationService.getCurrentCity();
    isLoading = false;
    notifyListeners();
  }
}