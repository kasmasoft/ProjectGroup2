import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_time_application/services/geolocator_service.dart';

class PrayerTimesBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  Position? currentLocation;
  late PrayerTimes currentDayPrayers;

  PrayerTimesBloc() {
    setCurrentLocation();
    setTodayPrayers();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }

  setTodayPrayers() async {
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    currentDayPrayers = PrayerTimes.today(
        Coordinates(currentLocation!.latitude, currentLocation!.longitude),
        params);
    notifyListeners();
  }
}
