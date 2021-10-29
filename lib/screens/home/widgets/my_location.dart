// ignore_for_file: unused_import, import_of_legacy_library_into_null_safe, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:geocoding/geocoding.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    setState(() {
      _currentPosition = position;
    });
    getUserLocation();
  }

  getUserLocation() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    Placemark place = placemarks[0];
    print(place);
    setState(() {
      _currentAddress = "${place.country}, ${place.subLocality}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (_currentPosition != Null && _currentAddress != null)
          ? Text(
              _currentAddress!,
              style: TextStyle(
                  color: color3,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            )
          : Text(
              '',
              style: TextStyle(
                  color: color2, fontWeight: FontWeight.w300, fontSize: 25),
            ),
    );
  }
}
