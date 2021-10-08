import 'package:geocoding/geocoding.dart';

class Address {
  getAddress(lat, lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    return placemarks.first.locality;
  }
}
