import '../constants.dart';
import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart' as geoc;
import 'package:location/location.dart' as loc;

class PrayerTimeHandler {
  loc.Location location = new loc.Location();
  geoc.Placemark? _address;
  PrayerTimes? _prayerTimes;
  CalculationMethod _method = CalculationMethod.dubai;
  Coordinates? _coordinates;
  String? _locationError;

  String? get locationError => _locationError;
  Coordinates? get coordinates => _coordinates;
  CalculationMethod get method => _method;
  PrayerTimes? get prayerTimes => _prayerTimes;
  String get address => _address != null
      ? '${_address!.locality}, ${_address!.subAdministrativeArea}, ${_address!.administrativeArea}'
      : '';

  Future<loc.LocationData?> getLocationData() async {
    var _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }

  void changeMethod(CalculationMethod value, VoidCallback refresh) {
    _method = value;
    if (_coordinates != null) {
      _prayerTimes = PrayerTimes(_coordinates,
          DateComponents.from(DateTime.now()), _method.getParameters());
    } else {
      getLocationData().then((locationData) {
        if (locationData != null) {
          geoc
              .placemarkFromCoordinates(locationData.latitude as double,
                  locationData.longitude as double)
              .then((value) {
            if (value != null && value.isNotEmpty) {
              _address = value.first;
            }
          });
          _coordinates =
              Coordinates(locationData.latitude, locationData.longitude);
          // change method and madhab
          final params = _method.getParameters();
          params.madhab = Madhab.hanafi;
          _prayerTimes = PrayerTimes(_coordinates,
              DateComponents.from(DateTime.now()), params);
          refresh();
        } else {
          _locationError = loadingText;
          refresh();
        }
      });
    }
  }
}
