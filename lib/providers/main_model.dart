import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class MainModel extends ChangeNotifier {

  var _hijridt = HijriCalendar.now();
  String _ggdt = DateFormat('EEEE, dd MMM').format(DateTime.now());

  Position? _currentPosition;
  late List<String?> _currentAddress;

  HijriCalendar get curhijridate => _hijridt;
  String get curggdate => _ggdt;

  Future<List<String?>> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    _currentPosition = position;
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    Placemark place = placemarks[0];
    print(place);
    _currentAddress = [
      place.country,
      place.subAdministrativeArea,
      place.subLocality
    ];
    return _currentAddress;
  }

  void removeAll() {
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
