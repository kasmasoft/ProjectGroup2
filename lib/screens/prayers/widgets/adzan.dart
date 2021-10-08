// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';
import 'prayer_container.dart';
import 'icon_text.dart';
import 'date_picker.dart';

class Adzan extends StatefulWidget {
  @override
  State<Adzan> createState() => _AdzanState();
}

class _AdzanState extends State<Adzan> {
  late PrayerTimes prayerTimes;
  final Color color1 = Color(0xFF8000e8);
  final Color color2 = Color(0xFFFFFFFF);
  final Color color3 = Color(0xFF8133d4);

  @override
  void initState() {
    prayerTimes = PrayerTimes(
        Coordinates(19.29209743677179, 72.85928629201034),
        DateComponents.from(DateTime.now()),
        CalculationMethod.karachi.getParameters());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color1, color2])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          iconText(
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 15,
              ),
              "Mira Road, Thane",
              "India"),
          SizedBox(
            height: 25,
          ),
          DatePicker(),
          SizedBox(
            height: 25,
          ),
          prayerContainer("Fajr", DateFormat.jm().format(prayerTimes.fajr)),
          SizedBox(
            height: 15,
          ),
          prayerContainer(
              "Sunrise", DateFormat.jm().format(prayerTimes.sunrise)),
          SizedBox(
            height: 15,
          ),
          prayerContainer("Dhuhr", DateFormat.jm().format(prayerTimes.dhuhr)),
          SizedBox(
            height: 15,
          ),
          prayerContainer("Asr", DateFormat.jm().format(prayerTimes.asr)),
          SizedBox(
            height: 15,
          ),
          prayerContainer(
              "Maghrib", DateFormat.jm().format(prayerTimes.maghrib)),
          SizedBox(
            height: 15,
          ),
          prayerContainer("Isha", DateFormat.jm().format(prayerTimes.isha)),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    ));
  }
}
