import 'package:flutter/material.dart';
import 'widgets/fast_calendar.dart';

class FastTracker extends StatefulWidget {
  const FastTracker({Key? key}) : super(key: key);
  static String routeName = "/fasttracker";

  @override
  _FastTrackerState createState() => _FastTrackerState();
}

class _FastTrackerState extends State<FastTracker> {
  @override
  Widget build(BuildContext context) {
    return Calendar();
  }
}
