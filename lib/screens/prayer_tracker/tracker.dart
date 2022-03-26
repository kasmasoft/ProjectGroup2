import 'package:flutter/material.dart';
import 'package:prayer_time_application/screens/prayer_tracker/widgets/prayer_calendar.dart';


class PrayerTracker extends StatefulWidget {
  const PrayerTracker({Key? key}) : super(key: key);
  static String routeName = "/prayertracker";

  @override
  _PrayerTrackerState createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Calendar(),
    );
  }
}
