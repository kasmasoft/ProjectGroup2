// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:geolocator/geolocator.dart';

class Location {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      return position;
    }).catchError((e) {
      print(e);
    });
  }
}